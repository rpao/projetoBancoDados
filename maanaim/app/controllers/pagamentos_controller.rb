class PagamentosController < LancamentosController
  before_action :set_pagamento, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  
  # GET /pagamentos/1
  # GET /pagamentos/1.json
  def show
  end



  # POST /pagamentos
  # POST /pagamentos.json
  def create
    @pagamento = Pagamento.new(pagamento_params)
    @pagamento.save
    redirect_to pagamentos_path(evento: @pagamento.conta_evento.evento)
   
  end

  # PATCH/PUT /pagamentos/1
  # PATCH/PUT /pagamentos/1.json
  def update
    
    
    @pagamento.update(pagamento_params)
    redirect_to pagamentos_path(evento: @pagamento.conta_evento.evento)
    
  end

  # DELETE /pagamentos/1
  # DELETE /pagamentos/1.json
  def destroy
    @pagamento.destroy
    respond_to do |format|
      format.html { redirect_to pagamentos_url, notice: 'Pagamento was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pagamento
      @pagamento = Pagamento.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pagamento_params
      params.require(:pagamento).permit(:data, :conta_evento_id, :valor, :desconto, :forma_de_pagamento)
    end
end
