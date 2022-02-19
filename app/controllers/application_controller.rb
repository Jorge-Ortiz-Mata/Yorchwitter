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

    def post_belongs_to_current_account
        if current_account.user != @post.user
            redirect_to root_path, alert: "This post doesn't belong to you."
        end
    end

    def user_belongs_to_current_account
        if current_account.user != @user
            redirect_to root_path, alert: "This profile doesn't belong to you."
        end
    end

    def account_belongs_to_current_account
        if current_account != @account
            redirect_to root_path, alert: "This account doesn't belong to you."
        end
    end

    def comment_belongs_to_current_account
        if current_account != @comment.user
            redirect_to root_path, alert: "This account doesn't belong to you."
        end
    end
end
