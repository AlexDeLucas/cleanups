class UsersController < ApplicationController
    def index   
    end

    # GET /users/:id
    def show
        @cleanups = current_user.cleanups.order(date: :desc)
    end
end 