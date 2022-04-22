
# Controller to manage creating and assigning projects
class ProjectsController < ApplicationController

  # New project form
  def new
    @team = params[:team_id]
  end

  # Create new project with the given team
  def create
    
    @project = Project.new(name: params[:name], team_id: params[:team_id])
    if @project.save
      flash[:success] = "Project Successfully Created!"
      redirect_to teacher_path(current_teacher.id)
    else
      render 'new'
    end
  end

  # Show one project
  def show
    @project = Project.find_by(id: params[:projectID])
    @students = @project.team.students
  end

  # Display index of projects 
  def index
    if teacher_logged_in?
      @teams = current_teacher.teams
    else
      @teams = current_student.teams
    end

    @team = @teams.find_by(id: params[:teamID])
    @students = @team.students
    @projects = @team.projects
  end
end
