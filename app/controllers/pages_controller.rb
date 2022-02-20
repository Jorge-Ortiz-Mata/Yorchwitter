class PagesController < ApplicationController

    before_action :require_account

    def home
        @posts = Post.order('created_at DESC')
    end
end
