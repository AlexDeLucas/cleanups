class StatesController < ApplicationController

    # GET /states/:id
    def show
        @cleanups = Cleanup.where(state: params[:id])
        # @cleanups_by_city = @cleanups.group_by(&:city)
        @state_name = params[:id]
    end
end