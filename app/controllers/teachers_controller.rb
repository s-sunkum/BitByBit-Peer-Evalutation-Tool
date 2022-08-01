 #Controller for managing teacher and his dashboard
 class TeachersController < ApplicationController

  #Signup form for teacher
  def new
    @teacher = Teacher.new
  end

  # Teacher's Dashboard
  def show
    @teacher = Teacher.find(params[:id])
  end

  # Signing up a teacher
  def create
    @teacher = Teacher.new(teacher_params)
    if @teacher.save
      teacher_log_in @teacher
      flash[:success] = "Welcome to PeerEval Tool!"
      redirect_to @teacher
    else
      render 'new'
    end
  end

  private

  def teacher_params
    params.require(:teacher).permit(:name, :email, :password)
  end
end
