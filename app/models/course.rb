class Course < ApplicationRecord
  belongs_to :subject
  belongs_to :course_type
  has_and_belongs_to_many :subject_applications

  alias type course_type

  def code
    course_type.name[0].concat(number.to_s)
  end
end
