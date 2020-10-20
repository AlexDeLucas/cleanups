class StatesController < ApplicationController

    # GET /states/:id
    def show
        @cleanups = Cleanup.group('cleanups.id').where(state: params[:id]).group("city")
        # @cleanups = Cleanup.group('cleanups.id').where(state: params[:id]).order("city")
        # @cleanups = Cleanup.where(state: params[:id]).group("city")
        # @cleanups = Cleanup.where(state: params[:id])
        # @cleanups_by_city = @cleanups.group_by(&:city)
        @state_name = params[:id]
    end
end