class EquipesController < ApplicationController
  before_action :set_equipe, only: [:show, :edit, :update, :destroy]

  # GET /equipes
  # GET /equipes.json
  def index
    @equipes = Equipe.all
  end

  # GET /equipes/1
  # GET /equipes/1.json
  def show
  end

  # GET /equipes/new
  def new
    @equipe = Equipe.new
  end

  # GET /equipes/1/edit
  def edit
  end

  # POST /equipes
  # POST /equipes.json
  def create
    @equipe = Equipe.new(equipe_params)

    respond_to do |format|
      if @equipe.save
        format.html { redirect_to @equipe, notice: 'Equipe was successfully created.' }
        format.json { render :show, status: :created, location: @equipe }
      else
        format.html { render :new }
        format.json { render json: @equipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /equipes/1
  # PATCH/PUT /equipes/1.json
  def update
    respond_to do |format|
      if @equipe.update(equipe_params)
        format.html { redirect_to @equipe, notice: 'Equipe was successfully updated.' }
        format.json { render :show, status: :ok, location: @equipe }
      else
        format.html { render :edit }
        format.json { render json: @equipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /equipes/1
  # DELETE /equipes/1.json
  def destroy
    @equipe.destroy
    respond_to do |format|
      format.html { redirect_to equipes_url, notice: 'Equipe was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_equipe
      @equipe = Equipe.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def equipe_params
      params.require(:equipe).permit(:nome, :tipo, :dtCadastro)
    end
end
