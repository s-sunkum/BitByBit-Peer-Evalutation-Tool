class StudentsController < ApplicationController
  def new
    @student = Student.new
  end

  def index
    @student = Student.all
  end

  def show 
    @student = Student.find(params[:id])
  end
  def create
    @student = Student.new(student_params)
    @student.teacher_id = current_teacher.id
    @student.password = "foobar123"
    @student.password_confirmation = "foobar123"
    if @student.save
      flash[:success] = "Student Successfully Created!"
      redirect_to teacher_path(current_teacher.id)
    else
      render 'new'
    end
  end

  private

  def student_params
    params.require(:student).permit(:name, :email, :access_token, :teacher_id)
  end
end
