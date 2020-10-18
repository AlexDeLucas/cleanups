class StatesController < ApplicationController

    # GET /states/:id
    def show
        @cleanups = Cleanup.where(state: params[:id])
        @state_name = params[:id]
    end
end