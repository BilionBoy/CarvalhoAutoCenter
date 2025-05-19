class ApplicationController < ActionController::Base
  layout :choose_layout

  private

  def choose_layout
  if controller_path.start_with?('admin/') || controller_name == 'vendas'
      "admin" 
    else
      "application" 
    end
  end

  def admin_controller?
    self.class.name.start_with?("Admin::")
  end
end
