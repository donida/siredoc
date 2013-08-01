class CartoriosController < ApplicationController
  before_action :set_cartorio, only: [:show, :edit, :update, :destroy]

  # GET /cartorios
  # GET /cartorios.json
  def index
    @cartorios = Cartorio.paginate(:page => params[:page], :order => 'nome asc', :per_page => 10)
#    @cartorios = Cartorio.all
  end

  # GET /cartorios/1
  # GET /cartorios/1.json
  def show
  end

  # GET /cartorios/new
  def new
    @cartorio = Cartorio.new
  end

  # GET /cartorios/1/edit
  def edit
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
