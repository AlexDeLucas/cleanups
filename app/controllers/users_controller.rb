class UsersController < ApplicationController

    # GET /user/:user_id/cleanups
    def index
         
    end

    def show
        @cleanups = current_user.cleanups
    end
end 