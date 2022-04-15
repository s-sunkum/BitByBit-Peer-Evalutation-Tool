class ApplicationController < ActionController::Base
    include TeacherSessionsHelper
    include StudentSessionsHelper
end
