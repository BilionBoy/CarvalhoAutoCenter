module Admin
  class UsersController < ApplicationController
    before_action :authenticate_user!

    def index
      @users = User.all
    end

    def edit
      @user = User.find(params[:id])
    end

    def update
      @user = User.find(params[:id])
      if @user.update(user_params)
        redirect_to admin_users_path, notice: "Usuário atualizado com sucesso!"
      else
        render :edit
      end
    end

    def destroy
      @user = User.find(params[:id])
      @user.destroy
      redirect_to admin_users_path, notice: "Usuário removido com sucesso!"
    end

    private

    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation) # Apenas campos do Devise
    end
  end
end
