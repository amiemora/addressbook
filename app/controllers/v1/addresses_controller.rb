class V1::AddressesController < ApplicationController
    def index
        @addresses = Address.all 

        render json: @addresses, status: :ok
    end 
    def show 
        @address  = Address.find(params[:id])
        render json: @address
    end 
    def create 
        @address = Address.new(address_params)

        if @address.save
        render json: @address, status: :created, location: @address
        else
        render json: @address.errors, status: :unprocessable_entity
        end
    end 
    def update 
        @address  = Address.find(params[:id])
        if @address.update(address_params)
            render json: @address
        else
            render json: @address.errors, status: :unprocessable_entity
        end
    end 
    def destroy 
        @address  = Address.find(params[:id])
        @address.destroy
    end 
    private

    def address_params
        params.require(:address).permit(
        :person_id,
        :street,
        :town,
        :zip,
        :state,
        :country
        )
    end
end