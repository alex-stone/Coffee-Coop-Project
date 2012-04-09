class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user, :user_signed_in?, :authenticate_user!, :authenticate_admin!

  private
    def current_user
      @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
    end

    def user_signed_in?
      return 1 if current_user
    end

    def authenticate_user!
      if !current_user
        flash[:error] = 'You need to sign in before accessing this page'
        redirect_to signin_sessions_path
      end
    end

    def authenticate_admin!
      if !current_user.is_admin?
        flash[:error] = 'You need to be an Admin to access this page!'
        redirect_to users_path
      end
    end
  
end
