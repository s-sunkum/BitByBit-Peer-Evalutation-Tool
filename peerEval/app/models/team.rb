class Team < ApplicationRecord
    validates :name, presence: true, length: { maximum: 50}, uniqueness: {case_sensitive: false}
    belongs_to :teacher
    has_and_belongs_to_many :students
end
