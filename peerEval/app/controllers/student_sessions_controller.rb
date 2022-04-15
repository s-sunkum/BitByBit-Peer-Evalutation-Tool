class StudentSessionsController < ApplicationController
  def new
    
  end


  def create
    student = Student.find_by(email: params[:session][:email].downcase)
    if student && student.authenticate(params[:session][:password])
      # Log the student in and redirect to the student's show page.
      student_log_in student
      redirect_to student
    else
      # Create an error message.
      flash.now[:danger] = 'Invalid email/password combination' 
      render 'new'
    end
  end

  def destroy 
    student_log_out
    redirect_to root_url
  end
end
