module Admin
  class DashboardController < ApplicationController
    before_action :authenticate_user!

    def index
      # Lógica do dashboard administrativo
    end
  end

  def users
  end
end
