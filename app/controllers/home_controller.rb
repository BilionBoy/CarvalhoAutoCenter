class HomeController < ApplicationController
  def index
    @testimonials = Testimonial.all
    @services = Service.all
    @technicians = Technician.all
  end
  def services
    @q = Roda.ransack(params[:q])
    @rodas = @q.result(distinct: true)
    @no_results = @rodas.empty?
  end
  
  

  def up
    render json: { status: "UP", time: Time.now }, status: :ok
  end

end