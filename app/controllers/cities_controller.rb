class CitiesController < ApplicationController

    # GET /states/:state_id/cities/:id
    def show
        @cleanups = Cleanup.where(city: params[:id]).sort_by { |date| date }
        @city_name = params[:id]
    end

end