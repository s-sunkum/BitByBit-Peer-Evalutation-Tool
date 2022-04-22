#Team model for managing teams
class Team < ApplicationRecord

    # Name must be present, unique and less than 50 chars
    validates :name, presence: true, length: { maximum: 50}, uniqueness: {case_sensitive: false}

    # foreign key to teacher
    belongs_to :teacher

    #Delete all projects and students if team is deleted
    has_many :projects, dependent: :destroy
    has_many :student_teams, dependent: :destroy
    has_many :students, through: :student_teams
end
