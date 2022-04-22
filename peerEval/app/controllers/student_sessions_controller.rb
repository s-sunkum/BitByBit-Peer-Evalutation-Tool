# Controller to manage student login sessions
class StudentSessionsController < ApplicationController

  # For student signup
  def new
    
  end

  # Login student by creating a session
  def create
    student = Student.find_by(email: params[:session][:email].downcase)
    if student && student.password == params[:session][:password]
      # Log the student in and redirect to the student's show page.
      student_log_in student
      redirect_to student
    else
      # Create an error message.
      flash.now[:danger] = 'Invalid email/password combination' 
      render 'new'
    end
  end

  #Logout student by destroying the session
  def destroy 
    student_log_out
    redirect_to root_url
  end
end
