module StudentSessionsHelper
      # Logs in the given student.
  def student_log_in(student)
    session[:student_id] = student.id
  end

  # Returns the current logged-in student (if any).
  def current_student
    @current_student ||= student.find_by(id: session[:student_id]) if session[:student_id]
  end

  # Returns true if the student is logged in, false otherwise.
  def student_logged_in?
    !current_student.nil?
  end

  # Logs out the current student.
  def student_log_out
    session.delete(:student_id)
    @current_student = nil
  end
end
