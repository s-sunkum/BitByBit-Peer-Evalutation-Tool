# Join table between students and teams model
class StudentTeam < ApplicationRecord

  # foreign keys to student and team
  belongs_to :student
  belongs_to :team
end
