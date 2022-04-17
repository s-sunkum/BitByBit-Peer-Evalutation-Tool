class Project < ApplicationRecord
    validates :name, presence: true, length: { maximum: 50}
    has_many :evaluations
    belongs_to :team
end
