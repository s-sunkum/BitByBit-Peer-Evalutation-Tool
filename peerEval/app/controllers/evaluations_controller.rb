class EvaluationsController < ApplicationController
  def new
    @eval = Evaluation.new
    @evaluatee = Student.find_by(id: params[:evaluateeID])
    @project = Project.find_by(id: params[:projectID])

  end

  def create
    
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
