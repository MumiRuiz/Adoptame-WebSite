class Admin::PetsController < ApplicationController
  before_action :set_admin_pet, only: [:show, :edit, :update, :destroy]

  # GET /admin/pets
  # GET /admin/pets.json
  def index
    @admin_pets = Admin::Pet.all
  end

  # GET /admin/pets/1
  # GET /admin/pets/1.json
  def show
  end

  # GET /admin/pets/new
  def new
    @admin_pet = Admin::Pet.new
  end

  # GET /admin/pets/1/edit
  def edit
  end

  # POST /admin/pets
  # POST /admin/pets.json
  def create
    @admin_pet = Admin::Pet.new(admin_pet_params)

    respond_to do |format|
      if @admin_pet.save
        format.html { redirect_to @admin_pet, notice: 'Pet was successfully created.' }
        format.json { render action: 'show', status: :created, location: @admin_pet }
      else
        format.html { render action: 'new' }
        format.json { render json: @admin_pet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/pets/1
  # PATCH/PUT /admin/pets/1.json
  def update
    respond_to do |format|
      if @admin_pet.update(admin_pet_params)
        format.html { redirect_to @admin_pet, notice: 'Pet was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @admin_pet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/pets/1
  # DELETE /admin/pets/1.json
  def destroy
    @admin_pet.destroy
    respond_to do |format|
      format.html { redirect_to admin_pets_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_pet
      @admin_pet = Admin::Pet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_pet_params
      params.require(:admin_pet).permit(:name, :age, :kind, :gender, :size, :story, :region, :city, :country, :institution)
    end
end
