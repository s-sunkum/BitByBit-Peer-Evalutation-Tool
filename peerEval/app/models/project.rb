class Project < ApplicationRecord
    validates :name, presence: true, length: { maximum: 50}, uniqueness: { case_sensitive: false}
    has_many :evaluations
    belongs_to :team
end
