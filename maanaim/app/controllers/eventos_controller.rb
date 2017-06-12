class EventosController < OrdenavelController
  before_action :set_evento, only: [:show, :edit, :update, :destroy, :relatorio]
  before_action :authenticate_user!

  # GET /eventos/1
  # GET /eventos/1.json
  def show
  end
  
  def relatorio
    @evento.gerar_relatorio
    render layout: false
  end


  # POST /eventos
  # POST /eventos.json
  def create
    @evento = Evento.new(evento_params)

    respond_to do |format|
      if @evento.save
        format.html { redirect_to :eventos, notice: 'Evento was successfully created.' }
        format.json { redirect_to :eventos, status: :created, location: @evento }
      else
        format.html { render :new }
        format.json { render json: @evento.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /eventos/1
  # PATCH/PUT /eventos/1.json
  def update
    respond_to do |format|
      if @evento.update(evento_params)
        format.html { redirect_to :eventos, notice: 'Evento was successfully updated.' }
        format.json { redirect_to :eventos, status: :ok, location: @evento }
      else
        format.html { render :edit }
        format.json { render json: @evento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /eventos/1
  # DELETE /eventos/1.json
  def destroy
    @evento.destroy
    respond_to do |format|
      format.html { redirect_to eventos_url, notice: 'Evento was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_evento
      @evento = Evento.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def evento_params
      params.require(:evento).permit(:quantidade_de_vagas, :data_de_inicio, :data_de_fim,:nome, :tipo_evento_id,pessoa_ids:[])
      
    end
    
end
