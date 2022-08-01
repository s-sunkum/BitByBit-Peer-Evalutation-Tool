#Student model to store student information
class Student < ApplicationRecord

  # Make all emails lowercase before saving
  before_save { self.email = email.downcase }

  # name must be present and less than 50 chars
  validates :name, presence: true, length: { maximum: 50 }

  # Email must follow a format, must be present and be unique
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: true

  # Password must be present and minimum 8 chars
  validates :password, presence: true, length: { minimum: 8 }

  #foreign key to teacher
  belongs_to :teacher

  # foreign key to student team join tavke
  has_many :student_teams, dependent: :destroy
  has_many :teams, through: :student_teams

  # has many evaluations
  has_many :evaluations
end
