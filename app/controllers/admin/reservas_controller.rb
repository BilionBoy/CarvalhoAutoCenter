class Admin::ReservasController < ApplicationController
  before_action :authenticate_user! # Garante que apenas usuários logados possam acessar
  before_action :set_pedido, only: [:destroy]

  def index
    @pedidos = Pedido.includes(:roda).order(created_at: :desc)

  end

def destroy
    @roda = @pedido.roda  # Acessa a roda associada ao pedido
    if @pedido.destroy  # Exclui o pedido
      @roda.update(quantidade: @roda.quantidade + 1)  # Aumenta a quantidade da roda em 1
      redirect_to admin_reservas_path, notice: 'Reserva cancelada e estoque atualizado.'
    else
      redirect_to admin_reservas_path, alert: 'Erro ao cancelar a reserva.'
    end
end
  private

  def set_pedido
    @pedido = Pedido.find(params[:id])
  end

end
