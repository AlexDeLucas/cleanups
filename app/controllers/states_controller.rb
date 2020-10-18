class StatesController < ApplicationController

    # GET /states/:id
    def show
        @cleanups = Cleanup.where(state: params[:id]).group_by(&:city)
        @state_name = params[:id]
    end
end