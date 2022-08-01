# Project model to manage projects made
class Project < ApplicationRecord

    # Name length should be less than 50
    validates :name, presence: true, length: { maximum: 50}

    # Delete all evaluations if project is deleted
    has_many :evaluations, dependent: :destroy

    # foreign key to team
    belongs_to :team
end
