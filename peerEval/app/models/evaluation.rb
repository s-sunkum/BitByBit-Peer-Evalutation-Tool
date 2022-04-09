class Evaluation < ApplicationRecord
    validates :score, presence: true, inclusion: {in: (1..5), message: "%{value} is not a valid size"}
    validates :comments, presence: true, length: { maximum: 500, minimum: 1}
    belongs_to :project

end



