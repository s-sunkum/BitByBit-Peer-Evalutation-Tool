class ApplicationController < ActionController::Base

    #Controller helpers to manage student and teacher login sessions
    include TeacherSessionsHelper
    include StudentSessionsHelper
end
