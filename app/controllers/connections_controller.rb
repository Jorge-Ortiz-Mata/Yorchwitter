class ConnectionsController < ApplicationController

    def create
        Connection.create(user_id: params[:user], follower_id: params[:follower])
        redirect_to search_path
    end

    def destroy
        @connection = Connection.check_db_connection(params[:user], params[:follower]).first
        @connection.destroy
        redirect_to search_path
    end

end
