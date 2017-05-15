class FormacaoEventosController < ApplicationController
  before_action :set_formacao_evento, only: [:show, :edit, :update, :destroy]

  # GET /formacao_eventos
  # GET /formacao_eventos.json
  def index
    @formacao_eventos = FormacaoEvento.all
  end

  # GET /formacao_eventos/1
  # GET /formacao_eventos/1.json
  def show
  end

  # GET /formacao_eventos/new
  def new
    @formacao_evento = FormacaoEvento.new
  end

  # GET /formacao_eventos/1/edit
  def edit
  end

  # POST /formacao_eventos
  # POST /formacao_eventos.json
  def create
    @formacao_evento = FormacaoEvento.new(formacao_evento_params)

    respond_to do |format|
      if @formacao_evento.save
        format.html { redirect_to @formacao_evento, notice: 'Formacao evento was successfully created.' }
        format.json { render :show, status: :created, location: @formacao_evento }
      else
        format.html { render :new }
        format.json { render json: @formacao_evento.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /formacao_eventos/1
  # PATCH/PUT /formacao_eventos/1.json
  def update
    respond_to do |format|
      if @formacao_evento.update(formacao_evento_params)
        format.html { redirect_to @formacao_evento, notice: 'Formacao evento was successfully updated.' }
        format.json { render :show, status: :ok, location: @formacao_evento }
      else
        format.html { render :edit }
        format.json { render json: @formacao_evento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /formacao_eventos/1
  # DELETE /formacao_eventos/1.json
  def destroy
    @formacao_evento.destroy
    respond_to do |format|
      format.html { redirect_to formacao_eventos_url, notice: 'Formacao evento was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_formacao_evento
      @formacao_evento = FormacaoEvento.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def formacao_evento_params
      params.require(:formacao_evento).permit(:pessoa_id, :data, :equipe_id, :evento_id)
    end
end
