class InstitutionsController < ApplicationController
  before_action :set_institution, only: [:show, :edit, :update, :destroy]
 
  

  # GET /institutions
  # GET /institutions.json
  def index
    @institutions = Institution.all
    @pets = Institution.all.limit(3)
  end

  # GET /institutions/1
  # GET /institutions/1.json
  def show
  end

  # GET /institutions/new
  def new
    @institution = Institution.new
  end

  # GET /institutions/1/edit
  def edit
  end

  # POST /institutions
  # POST /institutions.json
  def create
    @institution = Institution.new(institution_params)

    respond_to do |format|
      if @institution.save
        format.html { redirect_to @admin_institution, notice: 'Institution was successfully created.' }
        format.json { render action: 'show', status: :created, location: @admin_institution }
      else
        format.html { render action: 'new' }
        format.json { render json: @admin_institution.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /institutions/1
  # PATCH/PUT /institutions/1.json
  def update
    respond_to do |format|
      if @institution.update(institution_params)
        format.html { redirect_to @admin_institution, notice: 'Institution was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @admin_institution.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /institutions/1
  # DELETE /institutions/1.json
  def destroy
    @institution.destroy
    respond_to do |format|
      format.html { redirect_to admin_institutions_url }
      format.json { head :no_content }
    end
  end

  def preview
  @logo = Intitution_logo.find(params[:id])
   if @logo.contenttype == "image"          
      img_orig = Magick::Image.read("/assets/images/"+@photo.filename).first
      img = img_orig.resize_to_fit(200,200)
     @response.headers["Content-type"] = img.mime_type
      render :text => img.to_blob    
   end
end

  private


   

    # Use callbacks to share common setup or constraints between actions.
    def set_institution
      @institution = Institution.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def institution_params
      params.require(:institution).permit(:name, :username, :email, :password, :location, :website,:country,:region, :city, :logo, :manager, :description, :tag_list)
    end
end
