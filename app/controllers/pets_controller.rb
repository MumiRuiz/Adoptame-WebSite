class PetsController < ApplicationController
  before_action :set_pet, only: [:show, :edit, :update, :destroy]
  

  # GET /pets
  # GET /pets.json
  def index
   
      # @pets = Pet.all
      # if params[:tag]
      #   @pets = Pet.tagged_with(params[:tag])
      # else
      #   @pets = Pet.all
      # end

      # def index
      # @search = Pet.search(params[:q])
      # @pets = @search.result
      # end

      @search = Pet.ransack(params[:q])
      @pets = @search.result
      @institution = Institution.all
        
  
  end

   

  # GET /pets/1
  # GET /pets/1.json
  def show


  end

  # GET admin/pets/new
  def new
    @pet = Pet.new
    @institution = Institution.all
  end

  # GET admin/pets/1/edit
  def edit
  end

  # POST admin/pets
  # POST admin/pets.json
  def create
    @pet = Pet.new(pet_params)

    respond_to do |format|
      if @pet.save
        format.html { redirect_to @admin_pet, notice: 'Pet was successfully created.' }
        format.json { render action: 'show', status: :created, location: @admin_pet }
      else
        format.html { render action: 'new' }
        format.json { render json: @admin_pet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT admin/pets/1
  # PATCH/PUT admin/pets/1.json
  def update
    respond_to do |format|
      if @pet.update(pet_params)
        format.html { redirect_to @admin_pet, notice: 'Pet was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @admin_pet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE admin/pets/1
  # DELETE admin/pets/1.json
  def destroy
    @pet.destroy
    respond_to do |format|
      format.html { redirect_to admin_pets_url }
      format.json { head :no_content }
    end
  end

def preview
  @photo = Pet_photo.find(params[:id])
   if @photo.contenttype == "image"          
      img_orig = Magick::Image.read("/assets/images/"+@photo.filename).first
      img = img_orig.resize_to_fit(200,200)
      img = img.vignette(x, y, radius=0.0, sigma=10.0)
     @response.headers["Content-type"] = img.mime_type
      render :text => img.to_blob    
   end
end

 def search
    @pets = Pet.tagged_with(params[:search])
    
    if @pets.empty?
      redirect_to home_index_path, alert: 'No se encontraron restaurantes con los criterios de busqueda ingresados. Por favor intente con otra palabra.' 
    end
  end


private
    # Use callbacks to share common setup or constraints between actions.
    def set_pet
      @pet = Pet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pet_params
      params.require(:pet).permit(:name, :age, :kind, :gender, :size, :story, :city, :country, :region, :user_id, :institution_id, :manager, :photo,:tag_list)
    end
end