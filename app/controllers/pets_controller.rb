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
      @pets = Pet.joins(:user).where("lower(city) LIKE :search OR lower(breed) LIKE :search", search: "%#{@parameter}%")

      render 'index'
    end  
  end

  def new
    @pet = Pet.new
  end
  
  def create
    @pet = Pet.new(pet_params)
    @pet.user = current_user


    if !@pet.image
      @pet.image = 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAOEAAADhCAMAAAAJbSJIAAAANlBMVEX///+9vsC6u73k5OXT1NX7+/u3uLu+v8H5+fnW19jIycvP0NH09PXp6erx8fHFxsjd3d7m5ufs9xf2AAAEjklEQVR4nO2dadOrIAxG6wLWnf7/P3ux2ta+3RQSE73P+drpDGcCBJDldAIAAAAAAAAAAAAAAAAAAAAAAADAM6ZrM1eWeVm6rO2MdHGI6VyV2HSOTSrXSheLiHNWebnkFa/Zu7N08aK5eL03dndL22fSRYzBlG+D9zeU+V4DafKv4ZsHst6lo1voNzqW0sVdTZss9xvr6kW6yOuo7Sq/q2O1oxzZrQzgLYy7SZBufQBH9tIa65AATmGspAu/hCpc0Cv20sX/TR8j6BUL7f1NpKBHuWK8oFeUlvhGVBu8obktlhSCXrGWFvlEG5oHXxSdtMp7zlSCPvU30jJv6ckElfY2jqYRjqS5tM4rhHV0wHbSQi9UpIJJoi5lkPWjN1JtK1QFsaBHWumZlrKbGVEWRMpMcUdaak5HH0IfRE1rUzWDoKru1FB3pCOKxm6kw5kHqZ6FKZZ+JlE0OiUesD1QU00znkqqaJ4YsUD6Ay3Lp2yCSSqtNsLWDL2hjjkUw5j0bqhjbMqUDa+GOjIiX0ejpavhyvcDOnI+o2BipeWuMFbSxKr4TMOXLHxXo2EbCtPUaTLUMDJlTPgw3Ijj19Lj9zT/QbZgFFSS8Y8/ajv+yJtz9qTjQ+nxZ8DN4VcxGNOFjq6U67vMgJZvM8dfEWYbe2tphow5X1rszvG/rjFVU027hqi3C41o6UkHWIY1SgY0EwwbhrR8eJpgSIlqkuEEfRB1hfB0ulAHUVsI6bO+jtn9HOI5lKZceIPoKMKIzgMJlJ2Ntm5mhLCeaqyjA2RJUdGQ+w9E64qaz1lSHF3TmChmkPQ2Kr5VfMLEK+r43PSZaEXtgp4i6qRzoV8w6iCp5uOjc8rgGwdUjtXeEbioYVUtW3zHBCTGtN9DE3yQLbhd6MnPqpvx/sLka1qjrVWn+Q803y/BmvtVSucSP2nqBY6prffqN2Bc8bVB+h/3f2VbVxYfb6Qryj2Hb8b5kvfTpYJXs+u1gkWeqdi0RkfTZi6vB3KXtQeTAwAAAAAA+8I0XXvJ5rTd7mdPnqa7uLKuitQ+X1s+zTJs0ufusst5lPFmdZ/a27zp20x4uqZ9NwE1XZZXo9rPZYznSXFaO/XR7Fw9zOqD1/b9Xyu1k2PTln2M3MNS5QLHaBctd5dME02SJqsoQvdX0hY6VsJNtnjtN0AyF2+SLZ/e5Ci6In5e8r5DNLaXcuyWrNrTOFYSdbXrOU8AvzhuflBvW79k8/chTMDzDvGOG74Pseb9EUrFrd6HaGi2r4WwzfsQwc9XULDFvkXOo9tLFLlfFjBRm7poYJ0ln+X9eDf3NRoEE8YdqCoiOMC2i5jjhFoQXD0qyfscNPDs5me8/2I9HCcyWO+DCoDekOesbzD09ZT8aYBYLHVWVBZC+uNtjFe0hEJ8Sxbp6UIaiM/Rqkn2M0hHNqwX64VCeqE5y/MOsZBeukB+GJ0C0pTIdo1QDKR3ncFQBBjCEIbywBCGMJQHhjCEoTwwhCEM5YEhDGEoDwxhCEN5YAhDGMoDQxjCUB4YwhCG8sAQhjCUB4YwhKE8MPx/DP8BTJJaKwTBcYoAAAAASUVORK5CYII='
    end

    if @pet.save
      redirect_to pet_path(@pet)
    else
      render new_pet_path
    end
  end
  
  def edit
    redirect_if_not_owner
  end
  
  def update
    if @pet
      @pet.update(pet_params)
      if @pet.errors.any?
        redirect_to edit_pet_path(@pet), alert: "Failed to edit pet: #{@pet.errors.full_messages.to_sentence}"
      else
        redirect_to @pet
      end
    else
      render "edit"
    end
  end
  
  def destroy
    events = Event.all.select { | event | event.host_pet == @pet || event.pets.first == @pet }
    events.each { | event | event.destroy }
    @pet.destroy
    redirect_to user_path(current_user.id), notice: "Successfully deleted pet."
  end
  
  private

  def set_pet
    @pet = Pet.find_by_id(params[:id])
  end

  def pet_params
    params.require(:pet).permit(:name, :breed, :weight, :gender, :birthdate, :image)
  end

end
