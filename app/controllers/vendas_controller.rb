class VendasController < ApplicationController
  before_action :set_venda, only: %i[ show edit update destroy ]

  def index
    ano = params[:year]&.to_i || Date.today.year
    mes = params[:month]&.to_i || Date.today.month
  
    @vendas = Venda.where("extract(year from data) = ? AND extract(month from data) = ?", ano, mes)
  
    @entradas = @vendas.where("valor >= 0").sum(:valor)
    @saidas = @vendas.where("valor < 0").sum(:valor).abs
    @total = @entradas - @saidas  end

  def show
  end

  def new
    @venda = Venda.new
  end

  def edit
  end



  def create
    @venda = current_user.vendas.new(venda_params)

    respond_to do |format|
      if @venda.save
        format.html { redirect_to @venda, notice: "Venda registrada com sucesso." }
        format.json { render :show, status: :created, location: @venda }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @venda.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @venda.update(venda_params)
        format.html { redirect_to @venda, notice: "Venda atualizada com sucesso." }
        format.json { render :show, status: :ok, location: @venda }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @venda.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @venda.destroy!
    respond_to do |format|
      format.html { redirect_to vendas_path, status: :see_other, notice: "Venda excluída com sucesso." }
      format.json { head :no_content }
    end
  end

  private

    def set_venda
      @venda = current_user.vendas.find(params[:id])
    end

    def venda_params
      params.require(:venda).permit(:descricao, :valor, :data)
    end
end
