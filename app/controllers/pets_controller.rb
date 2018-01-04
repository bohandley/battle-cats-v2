class PetsController < ApplicationController
  include PetsHelper

	before_action :set_pet, only: [:show, :edit, :update, :destroy, :vote]

	def index
    authenticate!
   	@pets = Pet.all.order(created_at: :desc)
 	end

	def show
    authenticate!
	end

  def new
    authenticate!
    @user = User.find_by(id: params[:user_id])
    @pet = Pet.new
  end

  def create
    authenticate!
    # if params[:pet][:avatar] == nil
    #   params[:pet][:avatar] = File.open((File.join(Rails.root,'/public/image10.png')))
    # end

    @user = User.find_by(id: params[:user_id])
    @pet = @user.pets.build(pet_params)

    if @pet.save
      redirect_to user_path(@user)
    else
      render "new"
    end
  end

  def vote
    authenticate!
    vote = Vote.create(pet_id: params[:id], user_id: current_user.id)
    if vote.save

      respond_to do |format|
        format.html {render 'show'}
        format.js {render 'vote'}
      end
    end
  end

  def edit
    @pet = Pet.find(params[:id])
    render "edit"
  end

  def update
    @pet = Pet.find_by(id: params[:id])
    @pet.assign_attributes(pet_params)
    if @pet.save
      render "show"
    else
      render "edit"
    end
  end

  def destroy
    authenticate!
    @user = User.find(@pet.owner_id)
    @pet.destroy
    redirect_to "/"
  end

private

  def set_pet
    @pet = Pet.find(params[:id])
  end


  def pet_params
    params.require(:pet).permit(:avatar, :name, :animal_type, :bio, :zipcode)
  end
end

