class UsersController < ApplicationController

    before_action :set_user, only: [:edit, :update]
    before_action :authenticate_user!

    def edit
      if current_user.id === @user.id
        render 'edit'
      else
        redirect_to tweets_path
      end

    end

    def update
        if @user.update(user_params)
          redirect_to tweets_path, notice: 'User was successfully updated.'
        else
          render 'edit'
        end
    end

    
  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:id, :email, :pseudo)
    end
end