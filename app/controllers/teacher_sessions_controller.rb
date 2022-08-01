# Controller for managing Teacher login sessions
class TeacherSessionsController < ApplicationController

  
  def new
  end

  # Creating a teacher login session
  def create
    teacher = Teacher.find_by(email: params[:session][:email].downcase)
    if teacher && teacher.password == params[:session][:password]
      # Log the teacher in and redirect to the teacher's show page.
      teacher_log_in teacher
      redirect_to teacher
    else
      # Create an error message.
      flash.now[:danger] = 'Invalid email/password combination' 
      render 'new'
    end
  end

  # Destroying a teacher login session
  def destroy
    teacher_log_out
    redirect_to root_url
  end
end
