class PetsController < ApplicationController
    before_action :set_pet, only: [:show, :edit, :update, :destroy]

    def index
        @pets = Pet.all
    end

    def show

    end
  
    def new
        @pet = Pet.new
    end
  
    def create
        @pet = Pet.new(pet_params)
        @pet.user = current_user
        if @pet.save
          redirect_to pet_path(@pet)
        else
          render "new"
        end
    end
  
    def edit

    end
  
    def update

    end
  
    def destroy

    end
  
    private

    def set_pet
      @pet = Pet.find_by_id(params[:id])
    end

    def pet_params
      params.require(:pet).permit(:name, :breed, :weight, :gender)
    end

end