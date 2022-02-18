class ApplicationController < ActionController::Base

    helper_method :current_user, :logged_in?

    def current_account
        @current_account ||= Account.find(session[:user_id]) if session[:user_id]
    end

    def logged_in?
        !!current_account
    end

    def require_account
        if !logged_in?
            redirect_to signin_path, alert: "You should login first."
        end
    end
end
