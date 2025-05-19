class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Define admin como falso por padrão
  after_initialize :set_default_admin, if: :new_record?


    has_many :vendas, dependent: :destroy

  private

  def set_default_admin
    self.admin ||= false
  end
end
