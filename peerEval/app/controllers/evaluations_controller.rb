class EvaluationsController < ApplicationController
  def new
    @eval = Evaluation.new
    session[:passed_variable] = params[:projectID]
    @project = Project.find_by(id: params[:projectID])
    @teammates = @project.team.students
  end

  def create
    @proj = session[:passed_variable]
    @eval = Evaluation.new(score: params[:score], comments: params[:comments], evaluator_id: current_student.id, evaluatee_id: params[:evaluatee_id], project_id: @proj)
    if @eval.save
      flash[:success] = "Successfully made an evaluation!"
    else
      flash[:danger] = "Whoops, something went wrong!"
    end
      redirect_to student_path(current_student.id)
  end

  def show
    @evals = Evaluation.all.select{ |e| e.evaluatee_id == params[:evaluatee_id]}
  end

  def index
    if teacher_logged_in?

      if params[:projectID] != nil
        @project = Project.find_by(id: params[:projectID].to_i)
      end
      
      @students = @project.team.students
      @seeEvals = false

      if params[:student_id] != nil  
        @seeEvals = true
        @evals = Evaluation.all.select{|e| e.evaluatee_id == params[:student_id].to_i && e.project == @project}
      end

    end
  end

end
