class PetsController < ApplicationController
  before_action :set_pet, only: [:show, :edit, :update, :destroy]
  

  # GET /pets
  # GET /pets.json
  def index
   
    @pets = Pet.all
  
  end

  # GET /pets/1
  # GET /pets/1.json
  def show
  end

  # GET /pets/new
  def new
    @pet = Pet.new
    # @institutions = Institution.all.map { |institution| [institution.name, institution.id] } 
  end

  # GET /pets/1/edit
  def edit
  end

  # POST /pets
  # POST /pets.json
  def create
    @pet = Pet.new(pet_params)

    respond_to do |format|
      if @pet.save
        format.html { redirect_to @pet, notice: 'Pet was successfully created.' }
        format.json { render action: 'show', status: :created, location: @pet }
      else
        format.html { render action: 'new' }
        format.json { render json: @pet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pets/1
  # PATCH/PUT /pets/1.json
  def update
    respond_to do |format|
      if @pet.update(pet_params)
        format.html { redirect_to @pet, notice: 'Pet was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @pet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pets/1
  # DELETE /pets/1.json
  def destroy
    @pet.destroy
    respond_to do |format|
      format.html { redirect_to pets_url }
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