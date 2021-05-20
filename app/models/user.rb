class User < ApplicationRecord
  has_many :subject_applications
  has_secure_password
end
