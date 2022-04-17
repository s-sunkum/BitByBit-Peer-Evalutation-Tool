class ProjectsController < ApplicationController
  def new
    @teams = current_teacher.teams
  end

  def create
    @teams = current_teacher.teams
    @project = Project.new(name: params[:name], team_id: params[:team_id])
    if @project.save
      flash[:success] = "Project Successfully Created!"
      redirect_to teacher_path(current_teacher.id)
    else
      render 'new'
    end
  end

  def show
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
