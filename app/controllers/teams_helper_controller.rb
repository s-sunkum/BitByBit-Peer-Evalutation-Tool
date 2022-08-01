# Helper controller for teams
class TeamsHelperController < ApplicationController

    # Form for adding students to team
    def index
        @current = []
        @tobeAdded = []
        @team = Team.find_by(id: params[:team_id])
        current_teacher.students.each do |s|
            if @team.students.include?(s)
                @current.push(s)
            else
                @tobeAdded.push(s)
            end
        end
    end

    # Adding a student to a team
    def create
        @student = Student.find_by(id: params[:student_id])
        @team = Team.find_by(id: params[:team_id])
  
        @student.teams << @team
        flash[:success] = "Student added to team!"
        redirect_to addstudents_path(:team_id => params[:team_id])

    end 

end
