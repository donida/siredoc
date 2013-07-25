class ComarcasController < ApplicationController
  before_action :set_comarca, only: [:show, :edit, :update, :destroy]

  # GET /comarcas
  # GET /comarcas.json
  def index
    @comarcas = Comarca.all
  end

  # GET /comarcas/1
  # GET /comarcas/1.json
  def show
  end

  # GET /comarcas/new
  def new
    @comarca = Comarca.new
  end

  # GET /comarcas/1/edit
  def edit
  end

  # POST /comarcas
  # POST /comarcas.json
  def create
    @comarca = Comarca.new(comarca_params)

    respond_to do |format|
      if @comarca.save
        format.html { redirect_to @comarca, notice: 'Comarca was successfully created.' }
        format.json { render action: 'show', status: :created, location: @comarca }
      else
        format.html { render action: 'new' }
        format.json { render json: @comarca.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comarcas/1
  # PATCH/PUT /comarcas/1.json
  def update
    respond_to do |format|
      if @comarca.update(comarca_params)
        format.html { redirect_to @comarca, notice: 'Comarca was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @comarca.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comarcas/1
  # DELETE /comarcas/1.json
  def destroy
    @comarca.destroy
    respond_to do |format|
      format.html { redirect_to comarcas_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comarca
      @comarca = Comarca.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comarca_params
      params.require(:comarca).permit(:nome, :chave, :latitude, :longitude, :gmaps)
    end
end
