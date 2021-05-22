class SubjectApplicationCreateService
  class MultipleCourseWithSameType < StandardError
    def message
      'Egy Kurzus típusból nem lehet többet felvenni!'
    end
  end
  class NotAllCourseTypeApplied < StandardError
    def message
      'Minden Kurzus típusból fel kell venni egyet!'
    end
  end
  class UserAlreadyAppliedToSubject < StandardError
    def message
      'Már felvetted a tárgyat!'
    end
  end

  attr_accessor :subject, :user, :courses

  def initialize(subject, user, courses)
    @subject = subject
    @courses = courses
    @user = user
  end

  def self.call(subject, user, courses)
    new(subject, user, courses).perform
  end

  def perform
    raise MultipleCourseWithSameType unless course_type_ids.length == course_type_ids.uniq.length
    raise NotAllCourseTypeApplied unless course_type_ids.sort == available_course_types.map(&:id).sort

    SubjectApplication.create!(user: user, subject: subject, courses: courses)
  rescue ActiveRecord::RecordNotUnique
    raise UserAlreadyAppliedToSubject
  end

  private

  def course_type_ids
    @course_type_ids ||= courses.map(&:course_type_id)
  end

  def available_course_types
    @available_course_types ||= Course.includes(:course_type).where(subject: subject)
                                      .map(&:course_type).uniq
  end
end
