class Admin::ReservasController < ApplicationController
  before_action :authenticate_user! # Garante que apenas usuários logados possam acessar
  before_action :set_pedido, only: [:destroy]

  def index
    @pedidos = Pedido.includes(:roda).order(created_at: :desc)
  end

  def destroy
    @pedido.destroy
    redirect_to admin_reservas_path, notice: 'Reserva cancelada com sucesso!'
  end

  private

  def set_pedido
    @pedido = Pedido.find(params[:id])
  end

  def authorize_admin!
    redirect_to root_path, alert: "Acesso não autorizado" unless current_user.admin?
  end
end
