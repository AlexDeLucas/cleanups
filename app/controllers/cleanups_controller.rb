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
    
end
