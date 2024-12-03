class ApplicationController < ActionController::Base
  layout :choose_layout

  private

  def choose_layout
    if admin_controller?
      "admin" # Usa o layout admin.html.erb
    else
      "application" # Usa o layout padrão application.html.erb
    end
  end

  def admin_controller?
    self.class.name.start_with?("Admin::")
  end
end
