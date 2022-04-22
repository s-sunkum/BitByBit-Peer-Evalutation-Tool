# Controller for managing teams
class TeamsController < ApplicationController

  # New team form
  def new
    @team = Team.new
  end

  # Creating the team
  def create
    @team = Team.new(team_params)
    @team.teacher_id = current_teacher.id
    if @team.save
      flash[:success] = "Team Successfully Created!"
      redirect_to teams_path
    else
      render 'new'
    end

  end

  # Team edit options
  def edit
  
  end
  
  # Deleting a team
  def destroy
    @team = Team.find(params[:id])
    if @team.destroy
      flash[:success] = "Team Removed From Class"
      redirect_to teams_path
    end
  end

  # Displaying team index
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
