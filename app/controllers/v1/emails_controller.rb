class V1::EmailsController < ApplicationController
    def index
        @email = Email.all 

        render json: @email, status: :ok
    end 
    def show 
        @email  = Email.find(params[:id])
        render json: @email
    end 
    def create 
        @email = Email.new(email_params)

        if @email.save
        render json: @email, status: :created, location: @email
        else
        render json: @email.errors, status: :unprocessable_entity
        end
    end 
    def update 
        @email  = Email.find(params[:id])
        if @email.update(email_params)
            render json: @email
        else
            render json: @email.errors, status: :unprocessable_entity
        end
    end 
    def destroy 
        #where(id: params[:id]).first
        @email  = Email.find(params[:id])
        @email.destroy
    end 
    private

    def email_params
        params.require(:email).permit(
        :person_id,
        :email_address,
        :email_address
        )
    end
end