class CleanupsController < ApplicationController

    # GET /cleanups
    def index
    end

    # GET /cleanups/new
    def new
        @cleanup = Cleanup.new 
    end
    
end
