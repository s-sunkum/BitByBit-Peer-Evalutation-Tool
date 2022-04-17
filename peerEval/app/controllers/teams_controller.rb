class TeamsController < ApplicationController
  def new
    @team = Team.new
  end

  def create
    @team = Team.new(team_params)
    @team.teacher_id = current_teacher.id
    if @team.save
      flash[:success] = "Team Successfully Created!"
      redirect_to teacher_path(current_teacher.id)
    else
      render 'new'
    end

  end

  def index
    @teams = StudentTeam.all.select { |m| m.student_id == current_student.id }
    
  end

  private
  def team_params
    params.require(:team).permit(:name)
  end
end
