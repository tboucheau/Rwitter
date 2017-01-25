class UserController < ApplicationController

    before_action :set_user, only: [:edit, :update]
    before_action :authenticate_user!

    def edit
    end

    def update
        @user.update(user_params)
        redirect_to tweets_path, notice: 'Tweet was successfully updated.'
    end

    
  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:user_id, :email, :pseudo)
    end
end