class PetsController < ApplicationController
  before_action :set_pet, only: [:show, :edit, :update, :destroy]

  def index
    @pets = Pet.all
  end

  def show

  end
  
  def search
    if params[:search].blank?  
      redirect_to(pets_path, alert: "Empty field!") and return  
    else  
      @parameter = params[:search].downcase  
      @pets = Pet.joins(:user).where("lower(city) LIKE :search OR lower(breed) LIKE :search OR lower(weight) LIKE :search", search: "%#{@parameter}%")

      render 'index'
    end  
  end

  def new
    @pet = Pet.new
  end
  
  def create
    @pet = Pet.new(pet_params)
    @pet.user = current_user


    if !@pet.avatar.attached?
      @pet.avatar.attach(io: File.open('./public/default-profile.jpg'), filename: 'default-profile.jpg')
    end

    if @pet.save
      redirect_to pet_path(@pet)
    else
      render "new"
    end
  end
  
  def edit
    redirect_if_not_owner
  end
  
  def update
    if @pet
      @pet.update(pet_params)
      if @pet.errors.any?
        render "edit"
      else
        redirect_to @pet
      end
    else
      render "edit"
    end
  end
  
  def destroy

  end
  
  private

  def set_pet
    @pet = Pet.find_by_id(params[:id])
  end

  def pet_params
    params.require(:pet).permit(:name, :breed, :weight, :gender, :avatar)
  end

end
