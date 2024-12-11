class PedidosController < ApplicationController
  def create
    Rails.logger.debug("PARAMS: #{params.inspect}")  # Adiciona um log para inspecionar os parâmetros
    @roda = Roda.find(params[:pedido][:roda_id])
    @pedido = Pedido.new(pedido_params)
    @pedido.roda = @roda
    @pedido.status = 'reservado'
    
    if @pedido.save
      redirect_to root_path, notice: 'Pedido realizado com sucesso!'
    else
      render :new
    end
  end
  
  private

  def pedido_params
    params.require(:pedido).permit(:nome, :telefone, :email, :roda_id)
  end
end
