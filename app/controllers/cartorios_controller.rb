class CartoriosController < ApplicationController
  before_action :set_cartorio, only: [:show, :edit, :update, :destroy]

  respond_to :json
  
  # GET /cartorios
  # GET /cartorios.json
  def index
    #@associados_itens = ['Sim', 'Não']
    @cartorios = Cartorio.search(params[:nome], params[:cidade_nome], params[:atribuicao_nome], params[:tipoRegistro_nome], params[:comarca_nome], params[:page])
    @tipoRegistros = TipoRegistro.order('nome asc')
    @comarcas = Comarca.order('nome asc')
    @atribuicaos = Atribuicao.order('nome asc')
  end

  # GET /cartorios/1
  # GET /cartorios/1.json
  def show
  end

  # GET /cartorios/new
  def new
    @tipoRegistros = TipoRegistro.all
    @cartorio = Cartorio.new
    @estados = Estado.order("nome asc")
    @cidades = []
    @comarcas = Comarca.order('nome asc')
    @atribuicaos = []
    @tipoRegistro = nil
  end

  # GET /cartorios/1/edit
  def edit
    @cartorio = Cartorio.find(params[:id])
    @estado = Estado.find(@cartorio.cidade.estado_id)
    @tipoRegistros = TipoRegistro.all
    @estados = Estado.order("nome asc")
    @cidades = Cidade.where("estado_id = ?", @estado.id).order('nome asc')
    @comarcas = Comarca.order('nome asc')
    @id_tipo_registro = nil
    for atribuicao in @cartorio.atribuicaos
      @id_tipo_registro = atribuicao.tipoRegistro_id
    end 
    if @id_tipo_registro != nil
      @tipoRegistro = TipoRegistro.find(@id_tipo_registro)
      @atribuicaos = Atribuicao.where('"tipoRegistro_id" = ?', @id_tipo_registro).order('nome asc')
    else
      @atribuicaos = []
      @tipoRegistro = nil
    end
  end

  # POST /cartorios
  # POST /cartorios.json
  def create
    respond_to do |format|
      @cartorio = Cartorio.new(cartorio_params)
      @cartorio.numero = -1
      @cartorio.complemento = 'inexistente'
      if @cartorio.save
        for atr_id in params[:cartorio][:atribuicaos]
          if atr_id != '' && atr_id != nil
           @atribuicaosCartorios = AtribuicaosCartorios.new
           @atribuicaosCartorios.cartorio_id = @cartorio.id
           @atribuicaosCartorios.atribuicao_id = atr_id
           @atribuicaosCartorios.save
          end
        end
        format.html { redirect_to @cartorio, notice: 'Cartorio nao foi criado com sucesso.' }
        format.json { render action: 'show', status: :created, location: @cartorio }
      else
        @tipoRegistros = TipoRegistro.order('nome asc')
        @comarcas = Comarca.order('nome asc')
        @estados = Estado.order("nome asc")
        @estado = Estado.find(@cartorio.cidade.estado_id)
        @cidades = Cidade.where("estado_id = ?", @estado.id).order('nome asc')
        @atribuicaos = []
        @tipoRegistro = nil
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
        @atribuicaosCartorioss = AtribuicaosCartorios.where("cartorio_id = ?", @cartorio.id)
        for atribuicaosCartorios in @atribuicaosCartorioss 
          atribuicaosCartorios.destroy
        end
        for atr_id in params[:cartorio][:atribuicaos]
          if atr_id != '' && atr_id != nil
           @atribuicaosCartorios = AtribuicaosCartorios.new
           @atribuicaosCartorios.cartorio_id = @cartorio.id
           @atribuicaosCartorios.atribuicao_id = atr_id
           @atribuicaosCartorios.save
          end
        end
        format.html { redirect_to @cartorio, notice: 'Cartorio nao foi atualizado com sucesso.' }
        format.json { head :no_content }
      else
        @tipoRegistros = TipoRegistro.order('nome asc')
        @estados = Estado.order("nome asc")
        @estado = Estado.find(@cartorio.cidade.estado_id)
        @cidades = Cidade.where("estado_id = ?", @estado.id).order('nome asc')
        @comarcas = Comarca.order('nome asc')
        @atribuicaos = []
        @tipoRegistro = nil
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
      params.require(:cartorio).permit(:codigo, :nome, :atribuicaos, :atribuicao_ids, :comarca_id, :cidade_id, :bairro, :rua, :numero, :complemento, :cep, :telefone, :celular, :email, :historico, :associado)
    end
end
