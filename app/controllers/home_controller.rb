class HomeController < ApplicationController
  def index
    @testimonials = Testimonial.all
    @services = Service.all
    @technicians = Technician.all
  end

  def up
    render json: { status: "UP", time: Time.now }, status: :ok
  end
end
