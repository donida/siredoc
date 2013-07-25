class TipoRegistrosController < ApplicationController
  before_action :set_tipo_registro, only: [:show, :edit, :update, :destroy]

  # GET /tipo_registros
  # GET /tipo_registros.json
  def index
    @tipo_registros = TipoRegistro.all
  end

  # GET /tipo_registros/1
  # GET /tipo_registros/1.json
  def show
  end

  # GET /tipo_registros/new
  def new
    @tipo_registro = TipoRegistro.new
  end

  # GET /tipo_registros/1/edit
  def edit
  end

  # POST /tipo_registros
  # POST /tipo_registros.json
  def create
    @tipo_registro = TipoRegistro.new(tipo_registro_params)

    respond_to do |format|
      if @tipo_registro.save
        format.html { redirect_to @tipo_registro, notice: 'Tipo registro was successfully created.' }
        format.json { render action: 'show', status: :created, location: @tipo_registro }
      else
        format.html { render action: 'new' }
        format.json { render json: @tipo_registro.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tipo_registros/1
  # PATCH/PUT /tipo_registros/1.json
  def update
    respond_to do |format|
      if @tipo_registro.update(tipo_registro_params)
        format.html { redirect_to @tipo_registro, notice: 'Tipo registro was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @tipo_registro.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tipo_registros/1
  # DELETE /tipo_registros/1.json
  def destroy
    @tipo_registro.destroy
    respond_to do |format|
      format.html { redirect_to tipo_registros_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tipo_registro
      @tipo_registro = TipoRegistro.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tipo_registro_params
      params.require(:tipo_registro).permit(:name, :chave)
    end
end
