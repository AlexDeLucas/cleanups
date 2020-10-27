class CleanupsController < ApplicationController

    # GET /cleanups
    def index
        @cleanups = Cleanup.all 
        @state_collection = Cleanup::STATES 
        # When the user selects a state, they are taken to the show page for that state
       respond_to do |format|
        format.html { render :index }
       end
    end

    # GET /cleanups/:id
    def show
        @cleanup = Cleanup.find(params[:id])   
    end 

    # GET /cleanups/new
    def new
        @cleanup = Cleanup.new
        @state_collection = Cleanup::STATES
        @cleanup_type_collection = Cleanup::CLEANUP_TYPES 
    end

    # POST /cleanups
    def create
        @cleanup = Cleanup.new(cleanup_params)
        @cleanup.user = current_user
        if @cleanup.save
            flash[:notice] = 'You logged a cleanup!'
            redirect_to @cleanup
        else 
            flash[:alert] = @cleanup.errors.full_messages.join(', ')
            @state_collection = Cleanup::STATES
            @cleanup_type_collection = Cleanup::CLEANUP_TYPES 
            render action: 'new'
        end
    end

    # EDIT /cleanups/:id/edit
    def edit
        @cleanup = Cleanup.find(params[:id])
        @state_collection = Cleanup::STATES
        @cleanup_type_collection = Cleanup::CLEANUP_TYPES
    end

    def update
        @cleanup = Cleanup.find(params[:id])
        @cleanup.update(cleanup_params)
        if @cleanup.save
            flash[:notice] = 'Changes Saved'
            redirect_to cleanup_path
        else
            flash[:alert] = @cleanup.errors.full_messages.join(', ')
            @state_collection = Cleanup::STATES
            @cleanup_type_collection = Cleanup::CLEANUP_TYPES 
            render :edit 
        end
    end

    # DELETE /cleanups/:id
    def destroy
        @cleanup = Cleanup.find(params[:id])
        if @cleanup.destroy
            flash[:notice] = "Cleanup Deleted"
            redirect_to user_path
        end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cleanup_params
        params.require(:cleanup).permit(
            :user_id, 
            :title,
            :date, 
            :posted_by, 
            :state, 
            :city, 
            :cleanup_type, 
            :volunteers,
            :total_trash, 
            :description,
            :cleanup_photo,
            :remove_cleanup_photo
        )
    end 
end
