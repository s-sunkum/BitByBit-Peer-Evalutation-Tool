class Team < ApplicationRecord
    validates :name, presence: true, length: { maximum: 50}, uniqueness: {case_sensitive: false}
    belongs_to :teacher
    has_many :projects
    has_many :student_teams
    has_many :students, through: :student_teams
end
