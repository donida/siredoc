class CartoriosController < ApplicationController
  before_action :set_cartorio, only: [:show, :edit, :update, :destroy]

  respond_to :json
  
  # GET /cartorios
  # GET /cartorios.json
  def index
    @cartorios = Cartorio.paginate(:page => params[:page], :order => 'nome asc', :per_page => 10)
  end

  # GET /cartorios/1
  # GET /cartorios/1.json
  def show
  end

  # GET /cartorios/new
  def new
    @cartorio = Cartorio.new
    @estados = Estado.all
    @cidades = []
    @comarcas = Comarca.all
    @tipoRegistros = TipoRegistro.all
    @atribuicoes = []
  end

  # GET /cartorios/1/edit
  def edit
    @estados = Estado.all
    @cidades = Cidade.find_by_estado_id(params[@cartorio.cidade.estado_id])
    @comarcas = Comarca.all
    @tipoRegistros = TipoRegistro.all
    @atribuicoes = Atribuicao.find_by_tipo_registro_id(params[@cartorio.atribuicao.tipoRegistro_id])
  end

  # POST /cartorios
  # POST /cartorios.json
  def create
    @cartorio = Cartorio.new(cartorio_params)

    respond_to do |format|
      if @cartorio.save
        format.html { redirect_to @cartorio, notice: 'Cartorio was successfully created.' }
        format.json { render action: 'show', status: :created, location: @cartorio }
      else
        @atribuicoes = []
        @comarcas = Comarca.all
        @estados = Estado.all
        @cidades = []
        @tipoRegistros = TipoRegistro.all
        format.html { render action: 'new' }
        format.json { render json: @cartorio.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cartorios/1
  # PATCH/PUT /cartorios/1.json
  def update
    respond_to do |format|
      if @cartorio.update(cartorio_params)
        format.html { redirect_to @cartorio, notice: 'Cartorio was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @cartorio.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cartorios/1
  # DELETE /cartorios/1.json
  def destroy
    @cartorio.destroy
    respond_to do |format|
      format.html { redirect_to cartorios_url }
      format.json { head :no_content }
    end
  end

  def update_cidades
    @cidades = []
    if params[:estado_id] != ''
      @estado = Estado.find(params[:estado_id])
      if @estado != nil
        @cidades = @estado.cidades
      end
    end
    respond_to do |format|
      format.json { render :json => @cidades }
    end
  end

  def update_atribuicoes
    @atribuicaos = []
    if params[:tipoRegistro_id] != ''
      @atribuicaos = Atribuicao.find_all_by_tipoRegistro_id(params[:tipoRegistro_id])
      if @atribuicaos == nil
        @atribuicaos = []
      end
    end
    respond_to do |format|
      format.json { render :json => @atribuicaos }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cartorio
        @cartorio = Cartorio.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cartorio_params
      params.require(:cartorio).permit(:codigo, :nome, :atribuicao_id, :comarca_id, :cidade_id, :bairro, :rua, :numero, :complemento, :cep, :telefone, :celular, :email, :historico)
    end
end
