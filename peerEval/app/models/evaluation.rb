class Evaluation < ApplicationRecord
    validates :score, presence: true, inclusion: {in: (1..5), message "%{value} is not a valid size"}
    validates :evaluator, presence: true
    validates :target_id, presence: true
    validates :team_id, presence: true


end



