class HomeController < ApplicationController
  def index
    @testimonials = Testimonial.all
    @services = Service.all
    @technicians = Technician.all
  end
  def services
    @q = Roda.ransack(params[:q])
  
    if params[:q].present? && params[:q][:categoria_eq].present?
      @rodas = @q.result(distinct: true)
    else
      @rodas = Roda.all
    end
  
    @no_results = @rodas.empty?
  end
  

  def up
    render json: { status: "UP", time: Time.now }, status: :ok
  end

end