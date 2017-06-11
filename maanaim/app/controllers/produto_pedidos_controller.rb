class ProdutoPedidosController < ApplicationController
  before_action :set_produto_pedido, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # GET /produto_pedidos
  # GET /produto_pedidos.json
  def index
    @produto_pedidos = ProdutoPedido.all
  end

  # GET /produto_pedidos/1
  # GET /produto_pedidos/1.json
  def show
  end

  # GET /produto_pedidos/new
  def new
    @produto_pedido = ProdutoPedido.new
  end

  # GET /produto_pedidos/1/edit
  def edit
  end

  # POST /produto_pedidos
  # POST /produto_pedidos.json
  def create
    produto_pedido = ProdutoPedido.new(produto_pedido_params)
    if produto_pedido.save
      
      @pedido = produto_pedido.pedido
      @produto_pedido = ProdutoPedido.new(pedido: @pedido)
      @total = 0.0
      @pedido.produto_pedidos.each { |pp| @total += pp.produto.preco*pp.quantidade }
      render 'create.js'
    else
      render 'create.js'
    end
  end

  # PATCH/PUT /produto_pedidos/1
  # PATCH/PUT /produto_pedidos/1.json
  def update
    respond_to do |format|
      if @produto_pedido.update(produto_pedido_params)
        format.html { redirect_to @produto_pedido, notice: 'Produto pedido was successfully updated.' }
        format.json { render :show, status: :ok, location: @produto_pedido }
      else
        format.html { render :edit }
        format.json { render json: @produto_pedido.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /produto_pedidos/1
  # DELETE /produto_pedidos/1.json
  def destroy
    @pedido = @produto_pedido.pedido
    @produto_pedido.destroy
    @produto_pedido = ProdutoPedido.new(pedido: @pedido)
    @total = 0.0
    @pedido.produto_pedidos.each { |pp| @total += pp.produto.preco*pp.quantidade }
    render 'destroy.js'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_produto_pedido
      @produto_pedido = ProdutoPedido.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def produto_pedido_params
      params.require(:produto_pedido).permit(:pedido_id, :produto_id, :quantidade)
    end
end
