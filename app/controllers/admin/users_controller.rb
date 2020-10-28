class Admin::UsersController < ApplicationController
    before_action :ensure_admin_user!
    def index
        @users = User.all  
    end

    def destroy
        @user = User.find(params[:id])
        @user.destroy
        redirect_to admin_users_path, notice: 'User deleted'
      end

    private

    def ensure_admin_user!
        unless current_user and current_user.is_admin?
            flash[:alert] = "Access denied."
            redirect_to root_path
        end
    end 
end