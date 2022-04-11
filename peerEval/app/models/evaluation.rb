class Evaluation < ApplicationRecord
  validates :score, presence: true, inclusion: { in: (1..5), message: '%{value} is not a valid size' }
  validates :comments, presence: true, length: { maximum: 500, minimum: 1 }
  belongs_to :project
  belongs_to :evaluator, class_name: 'Student', foreign_key: 'evaluator_id'
  belongs_to :evaluatee, class_name: 'Student', foreign_key: 'evaluatee_id'
  validates :evaluatee_id, presence: true
  validates :evaluator_id, presence: true
end
