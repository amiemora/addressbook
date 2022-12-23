class V1::UsersController < ApplicationController
    before_action :authenticate, except: %i[create]
    before_action :find_user, except: %i[create]
    def show 
        render json: @user
    end 
    def create 
        #@user = User.find(params[:id])
        @user = User.new(user_params)

        if @user.save
        render json: @user, status: :created, location: @user
        else
        render json: @user.errors, status: :unprocessable_entity
        end
    end 
    private

    def user_params
        params.require(:user).permit(
        :email,
        :password,
        :password_confirmation
        )
    end
end