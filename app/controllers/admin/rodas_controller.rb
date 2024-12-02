class Admin::RodasController < ApplicationController
  before_action :authenticate_user! # Restringir acesso
  before_action :set_roda, only: [:edit, :update, :destroy]

  def index
    @rodas = Roda.all
  end

  def new
    @rodas = Roda.all # Definir @rodas para a sidebar

    @roda = Roda.new
  end

  def create
    @roda = Roda.new(roda_params)
    if @roda.save
      redirect_to admin_rodas_path, notice: "Roda criada com sucesso!"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @roda.update(roda_params)
      redirect_to admin_rodas_path, notice: "Roda atualizada com sucesso!"
    else
      render :edit
    end
  end

  def destroy
    @roda.destroy
    redirect_to admin_rodas_path, notice: "Roda removida com sucesso!"
  end

  private

  def set_roda
    @roda = Roda.find(params[:id])
  end

  def roda_params
    params.require(:roda).permit(:titulo, :descricao, :preco, :imagem)
  end
end
