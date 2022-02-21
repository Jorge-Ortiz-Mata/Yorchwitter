class SessionsController < ApplicationController

    def new
    end

    def create
        account = Account.find_by(email: params[:session][:email]) # <--- It converts the email into downcase string.
    
        if account && account.authenticate(params[:session][:password])   # <--- If the user logged_in succesfully.
            session[:user_id] = account.id                             # <-- Save the user into the session.
            redirect_to root_path, notice: "Welcome: ¡ #{account.user.first_name} #{account.user.last_name} !"
        else
            redirect_to signin_path, alert: "Invalid params."
        end
    end

    def destroy
        session[:user_id] = nil # <---- Destroy the user by assigning nil.
        redirect_to root_path, alert: "Logged out."
    end

end
