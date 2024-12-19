module Admin
  class DashboardController < ApplicationController
    before_action :authenticate_user!

    def index
      # Ações para o dashboard principal
    end

    def estoque
      @rodas = Roda.all
    end

    def users
      @users = User.all
    end

    def destroy_user
      @user = User.find(params[:id])
      @user.destroy
      redirect_to admin_users_path, notice: "Usuário removido com sucesso."
    end
  end
end
