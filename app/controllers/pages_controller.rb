class PagesController < ApplicationController

    before_action :require_account

    def home
        @posts = Post.order('created_at DESC')
    end

    def search
        @result = params[:result]
        if @result.present?
            @users_result = User.search_users(@result)
        end
    end
end
