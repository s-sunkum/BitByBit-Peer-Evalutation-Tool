# Controller to manage the student model and its attributes
class StudentsController < ApplicationController

  # New form for student
  def new
    @student = Student.new
  end

  # Index of all students
  def index
    @student = Student.all
  end

  #For updating student password
  def update_password
    @student = Student.new
  end

  # Handle the deletion of a student
  def destroy
    @student = Student.find(params[:id])
    if @student.destroy
      flash[:success] = "Student Removed From Class"
      redirect_to students_path
    end
  end
  
  #Student Dashboard
  def show 
    @student = Student.find(params[:id])
  end

  #Student's grade form
  def grade
    @student = Student.find(params[:id])
  end

  #For updating the student's grade
  def update
    @student = Student.find(params[:id])
    @student.update_attribute(:grade, params[:student][:grade])
    if @student.save
      flash[:success] = "Student Grade Successfully Updated!"
      redirect_to teacher_path(current_teacher.id)
    end
  end


  # For creating student accounts
  def create
    if teacher_logged_in?
      @student = Student.new(student_params)
      @student.teacher_id = current_teacher.id
      @student.password = "foobar123"
      @student.grade = 0
      if @student.save
        flash[:success] = "Student Successfully Created!"
        redirect_to students_path(current_teacher.id)
      else
        render 'new'
      end

    else
      @student = Student.find_by(email: params[:student][:email].downcase)
      if @student.valid? && @student.access_token == params[:student][:access_token]
        @student.password = params[:student][:password]
        if @student.save
          student_log_in @student
          flash[:success] = "Account successfully created!"
          redirect_to @student
        else
           render 'update_password'
        end
      else
        render 'index'
      end
    end
  end

  # For showing evaluations made by student
  def showEvaluations
    @submitted = false
    if(params[:team_id] != nil)
      @submitted = true
      @chosenTeam = current_student.teams.find_by(id: params[:team_id])
    end
    @teams = current_student.teams

  end

  #For showing evaluations made to student
  def personalEvaluations
    @submitted = false
    if(params[:team_id] != nil)
      @submitted = true
      @chosenTeam = current_student.teams.find_by(id: params[:team_id])
    end
    @teams = current_student.teams
  end

  private

  def student_params
    params.require(:student).permit(:name, :email, :access_token, :teacher_id, :password)
  end
end
