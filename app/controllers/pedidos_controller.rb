class PedidosController < ApplicationController
  def create
    @roda = Roda.find(params[:pedido][:roda_id])  # Encontrar a roda associada ao pedido
    @pedido = Pedido.new(pedido_params)  # Inicializa o pedido com os parâmetros recebidos
    @pedido.roda = @roda  # Associa a roda ao pedido
    @pedido.status = 'reservado'  # Define o status do pedido como 'reservado'

    if @roda.quantidade > 0
      if @pedido.save
        @roda.update(quantidade: @roda.quantidade - 1)
        redirect_to root_path, notice: 'Pedido realizado com sucesso!'
      else
        redirect_to services_path, alert: "Erro ao salvar o pedido."
      end
    else
      redirect_to services_path, alert: "Estoque insuficiente para realizar o pedido."
    end
  end

  private

  def pedido_params
    params.require(:pedido).permit(:nome, :telefone, :email, :roda_id)
  end
end
