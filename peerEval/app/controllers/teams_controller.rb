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

  def edit
    
  end

  def index
    if(!teacher_logged_in?)
      @teams = current_student.teams
    else 
      @teams = current_teacher.teams
    end  
  end

  private
  def team_params
    params.require(:team).permit(:name)
  end
end
