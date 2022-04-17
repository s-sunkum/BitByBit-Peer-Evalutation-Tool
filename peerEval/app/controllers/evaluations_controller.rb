class EvaluationsController < ApplicationController
  def new
    @eval = Evaluation.new
    @evaluatee = Student.find_by(id: params[:evaluateeID])
    @project = Project.find_by(id: params[:projectID])

  end

  def create
    byebug
  end

  def show
    @evals = Evaluation.all.select{ |e| e.evaluatee_id == params[:evaluatee_id]}
  end

end
