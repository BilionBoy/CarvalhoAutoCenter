class HomeController < ApplicationController
  def index
    @testimonials = Testimonial.all
    @services = Service.all
    @technicians = Technician.all
  end

  def services
    @testimonials = Testimonial.all
    @technicians = Technician.all

    @services = Service.all

    @rodas = Roda.all  # Ou qualquer lógica que recupere as rodas do banco de dados
  end

  def up
    render json: { status: "UP", time: Time.now }, status: :ok
  end
end
