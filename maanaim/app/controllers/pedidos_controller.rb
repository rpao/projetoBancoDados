class PedidosController < LancamentosController
  before_action :set_pedido, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # GET /pedidos
  # GET /pedidos.json

  # GET /pedidos/1
  # GET /pedidos/1.json
  def show
  end
  
  def edit
    @produto_pedido = ProdutoPedido.new(pedido: @pedido)
    @total = 0.0
    @pedido.produto_pedidos.each { |pp| @total += pp.produto.preco*pp.quantidade }
    render 'lancamentos/edit.js'
  end

  # POST /pedidos
  # POST /pedidos.json
  def create
    @pedido = Pedido.new(pedido_params)

    if @pedido.save
      @produto_pedido = ProdutoPedido.new(pedido: @pedido)
      render 'create.js'
    else
      render :new 
    end
  end

  # PATCH/PUT /pedidos/1
  # PATCH/PUT /pedidos/1.json
  def update
    respond_to do |format|
      if @pedido.update(pedido_params)
        format.html { redirect_to @pedido, notice: 'Pedido was successfully updated.' }
        format.json { render :show, status: :ok, location: @pedido }
      else
        format.html { render :edit }
        format.json { render json: @pedido.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pedidos/1
  # DELETE /pedidos/1.json
  def destroy
    @pedido.destroy
    respond_to do |format|
      format.html { redirect_to pedidos_url, notice: 'Pedido was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pedido
      @pedido = Pedido.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pedido_params
      params.require(:pedido).permit(:obs, :pessoa_id)
    end
end
