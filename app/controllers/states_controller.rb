class StatesController < ApplicationController

    # GET /states/:id
    def show
        # Find all cleanups in the state
        @cleanups = Cleanup.where(state: params[:id])
        # Find all the cities w/ cleanups in the state
        @cleanup_cities = @cleanups.map(&:city).uniq.sort_by { |cleanup_cities| cleanup_cities}
        @state_name = params[:id]        
    end
end