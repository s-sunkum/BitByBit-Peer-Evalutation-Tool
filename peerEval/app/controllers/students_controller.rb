class StudentsController < ApplicationController
  def new
    @student = Student.new
  end

  def index
    @student = Student.all
  end

  def update_password
    @student = Student.new
  end

  def show 
    @student = Student.find(params[:id])
  end

  def grade
    @student = Student.find(params[:id])
  end

  def update
    @student = Student.find(params[:id])
    @student.update_attribute(:grade, params[:student][:grade])
    if @student.save
      flash[:success] = "Student Grade Successfully Updated!"
      redirect_to teacher_path(current_teacher.id)
    end
  end

  def create
    if teacher_logged_in?
      @student = Student.new(student_params)
      @student.teacher_id = current_teacher.id
      @student.password = "foobar123"
      @student.grade = 0
      if @student.save
        flash[:success] = "Student Successfully Created!"
        redirect_to teacher_path(current_teacher.id)
      else
        render 'new'
      end

    else
      @student = Student.find_by(email: params[:student][:email].downcase)
      @student.password = "foobar123"
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

  private

  def student_params
    params.require(:student).permit(:name, :email, :access_token, :teacher_id, :password)
  end
end
