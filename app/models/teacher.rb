# Controller to manage teachers
class Teacher < ApplicationRecord

    # Make all emails lowercase before saving
    before_save { self.email = email.downcase }

    # Name must be present and less than 50 chars
    validates :name, presence: true, length: { maximum: 50 }

    # Email must follow a format, must be present and be unique
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 255 },
    format: { with: VALID_EMAIL_REGEX },
    uniqueness: true

    # Password must be present and minimum 8 chars
    validates :password, presence: true, length: { minimum: 8 }

    # Delete all students and teams if teacher is destroyed
    has_many :students, dependent: :destroy
    has_many :teams, dependent: :destroy
end
