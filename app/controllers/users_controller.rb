class UsersController < ApplicationController

    # GET /user/:user_id/cleanups
    def index
        @cleanups = current_user.cleanups 
    end

end 