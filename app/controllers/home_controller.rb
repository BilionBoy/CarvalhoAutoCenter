class HomeController < ApplicationController
  def index
    @testimonials = Testimonial.all
    @services = Service.all
  end
  
  def about
  end
  
  def services
  end
end
