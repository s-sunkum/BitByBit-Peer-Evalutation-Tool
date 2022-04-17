class EvaluationsController < ApplicationController
  def new
    @eval = Evaluation.new
  end

  def show
    @evals = Evaluation.all.select{ |e| e.evaluatee_id == params[:evaluatee_id]}
  end

  def evaluation_params
    params.require(:evaluation).permit(:score, :comments, :evaluator_id,
                                 :evaluatee_id)
  end
end
