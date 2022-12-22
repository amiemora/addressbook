class V1::PeopleController < ApplicationController
    def index
        @people = Person.all 

        render json: @people, status: :ok
    end 
    def show 
        @person  = Person.where(id: params[:id]).first
        render json: @person
    end 
    def create 
        @person = Person.new(person_params)

        if @person.save
        render json: @person, status: :created  #location: @person
        else
        render json: @person.errors, status: :unprocessable_entity
        end
    end 
    def update 
        @person  = Person.where(id: params[:id]).first
        if @person.update(person_params)
            render json: @person
        else
            render json: @person.errors, status: :unprocessable_entity
        end
    end 
    def destroy 
        @person  = Person.where(id: params[:id]).first
        if @person.destroy
            head(:ok)
        else
            head(:unprocessable_entity)
        end 
    end 

    private

    def person_params
        params.require(:person).permit(
      %i[salutation first_name middle_name last_name ssn dob comment]
    )
    end
end 