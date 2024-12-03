class HomeController < ApplicationController
  def index
    @testimonials = Testimonial.all
    @services = Service.all
    @technicians = Technician.all
  end

  def services
  
    # Fazendo a busca com Ransack
    @q = Roda.ransack(params[:q])
  
    # Verificando se o filtro de categoria foi deixado em branco ou se foi selecionada "Todas"
    if params[:q] && params[:q][:categoria_eq].blank?
      @rodas = Roda.all  # Caso a categoria seja "Todas" ou não tenha sido selecionada
    else
      @rodas = @q.result(distinct: true)  # Busca filtrada com os parâmetros de categoria e título
    end
  end
  

  def up
    render json: { status: "UP", time: Time.now }, status: :ok
  end

end