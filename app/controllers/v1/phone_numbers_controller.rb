class V1::PhoneNumbersController < ApplicationController
    before_action :authenticate
    def index
        @phone_number = PhoneNumber.all 

        render json: @phone_number, status: :ok
    end 
    def show 
        @phone_number  = PhoneNumber.find(params[:id])
        render json: @phone_number
    end 
    def create 
        @phone_number = PhoneNumber.new(phone_number_params)

        if @phone_number.save
        render json: @phone_number, status: :created, location: @phone_number
        else
        render json: @phone_number.errors, status: :unprocessable_entity
        end
    end 
    def update 
        @phone_number  = PhoneNumber.find(params[:id])
        if @phone_number.update(phone_number_params)
            render json: @phone_number
        else
            render json: @phone_number.errors, status: :unprocessable_entity
        end
    end 
    def destroy 
        @phone_number  = PhoneNumber.find(params[:id])
        @phone_number.destroy
    end 
    private

    def phone_number_params
        params.require(:phone_number).permit(
        :person_id,
        :phone_number,
        :comment
        )
    end
end