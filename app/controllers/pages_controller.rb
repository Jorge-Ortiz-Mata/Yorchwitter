class PagesController < ApplicationController

    before_action :require_account

    def home
        @users = User.order('created_at DESC')
        @posts = Post.order('created_at DESC')
    end

    def search
        @result = params[:result]
        if @result.present?
            @users_result = User.search_users(@result)
        else 
            @users_result = User.all
        end
    end
end
