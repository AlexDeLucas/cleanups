class CitiesController < ApplicationController

    # GET /states/:state_id/cities/:id
    def show
        @cleanups = Cleanup.where(city: params[:id])
    end

end