class AtribuicaosController < ApplicationController
  before_action :set_atribuicao, only: [:show, :edit, :update, :destroy]

  # GET /atribuicaos
  # GET /atribuicaos.json
  def index
    @atribuicaos = Atribuicao.all
  end

  # GET /atribuicaos/1
  # GET /atribuicaos/1.json
  def show
  end

  # GET /atribuicaos/new
  def new
    @atribuicao = Atribuicao.new
  end

  # GET /atribuicaos/1/edit
  def edit
  end

  # POST /atribuicaos
  # POST /atribuicaos.json
  def create
    @atribuicao = Atribuicao.new(atribuicao_params)
    
    respond_to do |format|
      if @atribuicao.save
        format.html { redirect_to @atribuicao, notice: 'Atribuicao was successfully created.' }
        format.json { render action: 'show', status: :created, location: @atribuicao }
      else
        format.html { render action: 'new' }
        format.json { render json: @atribuicao.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /atribuicaos/1
  # PATCH/PUT /atribuicaos/1.json
  def update
    respond_to do |format|
      if @atribuicao.update(atribuicao_params)
        format.html { redirect_to @atribuicao, notice: 'Atribuicao was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @atribuicao.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /atribuicaos/1
  # DELETE /atribuicaos/1.json
  def destroy
    @atribuicao.destroy
    respond_to do |format|
      format.html { redirect_to atribuicaos_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_atribuicao
      @atribuicao = Atribuicao.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def atribuicao_params
      params.require(:atribuicao).permit(:nome, :chave, :tipoCartorio_id)
    end
end
