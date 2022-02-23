class LikesController < ApplicationController
    
    before_action :require_account

    def create
        Like.create(account_id: params[:account], post_id: params[:post])
        redirect_to root_path
    end

    def destroy
        @like_connection = Like.where(account_id: params[:account], post_id: params[:post]).first
        @like_connection.destroy
        redirect_to root_path
    end
end
