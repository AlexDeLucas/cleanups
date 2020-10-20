class StatesController < ApplicationController

    # GET /states/:id
    def show
        # Find all cleanups in the state
        @cleanups = Cleanup.where(state: params[:id])
        # Find all the cities w/ cleanups in the state
        @cleanup_cities = @cleanups.map(&:city).uniq
        @state_name = params[:id]
        
    end
end


        # @cleanups = Cleanup.group('cleanups.id').where(state: params[:id]).group("city")
        # @cleanups = Cleanup.group('cleanups.id').where(state: params[:id]).order("city")
        # @cleanups = Cleanup.where(state: params[:id]).group("city")
        # @cleanups_by_city = @cleanups.group_by(&:city)

        # @uniq_cities = @cleanups_by_city.uniq