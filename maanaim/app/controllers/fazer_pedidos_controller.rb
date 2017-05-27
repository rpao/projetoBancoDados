class FazerPedidosController < ApplicationController
  before_action :set_fazer_pedido, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # GET /fazer_pedidos
  # GET /fazer_pedidos.json
  def index
    @fazer_pedidos = FazerPedido.all
  end

  # GET /fazer_pedidos/1
  # GET /fazer_pedidos/1.json
  def show
  end

  # GET /fazer_pedidos/new
  def new
    @fazer_pedido = FazerPedido.new
  end

  # GET /fazer_pedidos/1/edit
  def edit
  end

  # POST /fazer_pedidos
  # POST /fazer_pedidos.json
  def create
    @fazer_pedido = FazerPedido.new(fazer_pedido_params)

    respond_to do |format|
      if @fazer_pedido.save
        format.html { redirect_to @fazer_pedido, notice: 'Fazer pedido was successfully created.' }
        format.json { render :show, status: :created, location: @fazer_pedido }
      else
        format.html { render :new }
        format.json { render json: @fazer_pedido.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fazer_pedidos/1
  # PATCH/PUT /fazer_pedidos/1.json
  def update
    respond_to do |format|
      if @fazer_pedido.update(fazer_pedido_params)
        format.html { redirect_to @fazer_pedido, notice: 'Fazer pedido was successfully updated.' }
        format.json { render :show, status: :ok, location: @fazer_pedido }
      else
        format.html { render :edit }
        format.json { render json: @fazer_pedido.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fazer_pedidos/1
  # DELETE /fazer_pedidos/1.json
  def destroy
    @fazer_pedido.destroy
    respond_to do |format|
      format.html { redirect_to fazer_pedidos_url, notice: 'Fazer pedido was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fazer_pedido
      @fazer_pedido = FazerPedido.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fazer_pedido_params
      params.require(:fazer_pedido).permit(:evento_id, :pedido_id, :account_id)
    end
end
