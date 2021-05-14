class SubjectApplication < ApplicationRecord
  belongs_to :subject
  belongs_to :user
  has_and_belongs_to_many :courses
end
