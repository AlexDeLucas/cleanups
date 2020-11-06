class Admin::CleanupsController < ApplicationController
    before_action :ensure_admin_user!
    def index
        @cleanups = Cleanup.all.order(:posted_by)
    end

    def destroy
        @cleanup = Cleanup.find(params[:id])
        @cleanup.destroy
        redirect_to admin_cleanups_path, notice: 'Cleanup deleted'
      end

    private

    def ensure_admin_user!
        unless current_user and current_user.is_admin?
            flash[:alert] = "Access denied."
            redirect_to root_path
        end
    end 
end