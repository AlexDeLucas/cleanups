class CleanupsController < ApplicationController

    # GET /cleanups
    def index
    end

    # GET /cleanups/new
    def new
        @cleanup = Cleanup.new
        @state_collection = Cleanup::STATES
        @cleanup_type_collection = Cleanup::CLEANUP_TYPES 
    end

    # POST
    def create
    # Where/how is this object going to be stored? 
    # Once this is created, it needs to be accessible at the user's "My Cleanups" page
    # But the data needs to be retrievable for the public page of cleanups organized by state
    # And it needs to accessible as a public show page
        @cleanup = Cleanup.new(cleanup_params)
        @cleanup.user = current_user
    
    end
    
end
