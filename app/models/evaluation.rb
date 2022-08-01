# Evaluation model to manage evaluations made
class Evaluation < ApplicationRecord

  #Score must be in range(1,5)
  validates :score, presence: true, inclusion: { in: (1..5), message: '%{value} is not a valid size' }

  # Comments must be present and maximum character length should be less than 500
  validates :comments, presence: true, length: { maximum: 500, minimum: 1 }

  #foreign key to project
  belongs_to :project

  # Evaluator and evaluatee foreign key for students
  belongs_to :evaluator, class_name: 'Student', foreign_key: 'evaluator_id'
  belongs_to :evaluatee, class_name: 'Student', foreign_key: 'evaluatee_id'

  # Must be present
  validates :evaluatee_id, presence: true
  validates :evaluator_id, presence: true
end
