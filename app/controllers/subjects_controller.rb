class SubjectsController < ApplicationController
  before_action :set_subject, only: %i[ show edit update destroy apply drop]

  # GET /subjects or /subjects.json
  def index
    @subjects = Subject.all
  end

  # GET /subjects/1 or /subjects/1.json
  def show
    @courses = @subject.courses.includes(:course_type)
    @subject_application = SubjectApplication.includes(:courses).where(user: current_user, subject: @subject)&.first
    @courses_applied = @subject_application&.courses
  end

  # GET /subjects/new
  def new
    @subject = Subject.new
  end

  # GET /subjects/1/edit
  def edit
  end

  # POST /subjects or /subjects.json
  def create
    ActiveRecord::Base.transaction do
      @subject = Subject.create!(subject_params)
      course_type_ids = params['subject']['courses'].split.map(&:to_i)
      course_type_ids.map do |id|
        Course.create!(course_type_id: id, subject: @subject)
      end
    end

    flash.notice = 'Sikeres tárgy létrehozás!'
    redirect_to subject_path(@subject)
  end

  def apply
    courses = Course.where(id: params['courses']).to_a
    SubjectApplicationCreateService.call(@subject, current_user, courses)
    flash.notice = 'Sikeres tárgyfelvétel!'
    redirect_to subject_path @subject
  rescue SubjectApplicationCreateService::NotAllCourseTypeApplied,
    SubjectApplicationCreateService::MultipleCourseWithSameType,
    SubjectApplicationCreateService::UserAlreadyAppliedToSubject => e
    flash.notice = e.message
    redirect_to subject_path @subject
  end

  def drop
    subject_application = SubjectApplication.where(user: current_user, subject: @subject).first
    subject_application.destroy!
    flash.notice = 'Sikeres leadás!'
    redirect_to subject_path(@subject)
  end

  # PATCH/PUT /subjects/1 or /subjects/1.json
  def update
    respond_to do |format|
      if @subject.update(subject_params)
        format.html { redirect_to @subject, notice: "Subject was successfully updated." }
        format.json { render :show, status: :ok, location: @subject }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @subject.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subjects/1 or /subjects/1.json
  def destroy
    @subject.destroy
    respond_to do |format|
      format.html { redirect_to subjects_url, notice: "Subject was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_subject
    @subject = Subject.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def subject_params
    params.require(:subject).permit(:name, :credit)
  end
end
