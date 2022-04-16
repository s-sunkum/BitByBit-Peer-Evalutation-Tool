class TeamsHelperController < ApplicationController
    def index
        @teams = current_teacher.teams
        @students = current_teacher.students
    end

    def create
        @teams = current_teacher.teams
        @students = current_teacher.students
        @student = Student.find_by(id: params[:student_id])
        @team = Team.find_by(id: params[:team_id])
        if(!@student.teams.include? @team)
            @student.teams << @team
            flash.now[:success] = "Student added to team!"
            render 'index'
        else
            flash.now[:danger] = "Student is already in this team!"
            render 'index'
        end
    end 

end
