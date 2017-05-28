class PessoasController < ApplicationController
  before_action :set_pessoa, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  helper_method :sort_column, :sort_direction
  # GET /pessoas
  # GET /pessoas.json
  def index
    @pessoas = Pessoa.order(sort_column + " " + sort_direction).search(params[:search]).paginate(:per_page => 5, :page => params[:page])
  end

  # GET /pessoas/1
  # GET /pessoas/1.json
  def show
  end

  # GET /pessoas/new
  def new
    @pessoa = Pessoa.new
  end

  # GET /pessoas/1/edit
  def edit
  end

  # POST /pessoas
  # POST /pessoas.json
  def create
    @pessoa = Pessoa.new(pessoa_params)

    respond_to do |format|
      if @pessoa.save
        format.html { redirect_to :pessoas, notice: 'Pessoa was successfully created.' }
        format.json { render :show, status: :created, location: @pessoa }
      else
        format.html { render :new }
        format.json { render json: @pessoa.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pessoas/1
  # PATCH/PUT /pessoas/1.json
  def update
    respond_to do |format|
      if @pessoa.update(pessoa_params)
        format.html { redirect_to :pessoas, notice: 'Pessoa was successfully updated.' }
        format.json { render :show, status: :ok, location: @pessoa }
      else
        format.html { render :edit }
        format.json { render json: @pessoa.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pessoas/1
  # DELETE /pessoas/1.json
  def destroy
    @pessoa.destroy
    respond_to do |format|
      format.html { redirect_to pessoas_url, notice: 'Pessoa was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pessoa
      @pessoa = Pessoa.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pessoa_params
      params.require(:pessoa).permit(:cpf, :nome, :sexo, :dtNasc, :logradouro, :cep, :bairro, :email, :telefone, :ativo)
    end
    
    def sort_column
      Pessoa.column_names.include?(params[:sort]) ? params[:sort] : "1"
    end
    
    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
end
