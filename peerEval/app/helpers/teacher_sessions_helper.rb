module TeacherSessionsHelper
  # Logs in the given teacher.
  def teacher_log_in(teacher)
    session[:teacher_id] = teacher.id
  end

  # Returns the current logged-in teacher (if any).
  def current_teacher
    @current_teacher ||= Teacher.find_by(id: session[:teacher_id]) if session[:teacher_id]
  end

  # Returns true if the teacher is logged in, false otherwise.
  def teacher_logged_in?
    !current_teacher.nil?
  end

  # Returns true if a test teacher is logged in.
  def teacher_is_logged_in?
    !session[:teacher_id].nil?
  end

    # Logs out the current teacher.
    def teacher_log_out
        session.delete(:teacher_id)
        @current_teacher = nil
    end
end
