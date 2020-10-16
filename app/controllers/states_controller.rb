class StatesController < ApplicationController

    # GET /states/:id
    def show
        @cleanups = Cleanup.where(state: params[:id]).group_by(&:city)
    end
end