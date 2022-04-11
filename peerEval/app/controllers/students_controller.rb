class StudentsController < ApplicationController
  def new
  end

  def index
    @students = Student.all
  end
end
