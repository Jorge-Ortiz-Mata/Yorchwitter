class PagesController < ApplicationController

    before_action :require_account

    def home
        @posts = Post.all
    end
end
