class Team < ApplicationRecord
    validates :name, presence: true, length: { maximum: 50}, uniqueness: {case_sensitive: false}
    belongs_to :teacher
    has_many :projects, dependent: :destroy
    has_many :student_teams, dependent: :destroy
    has_many :students, through: :student_teams
end
