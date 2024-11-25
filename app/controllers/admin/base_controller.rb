module Admin
  class BaseController < ApplicationController
    before_action :authenticate_user! # Exige autenticação do Devise
    before_action :ensure_admin # Garante que seja um administrador
    layout 'admin'

    private

    def ensure_admin
      redirect_to root_path, alert: 'Acesso negado!' unless current_user&.admin?
    end
  end
end
