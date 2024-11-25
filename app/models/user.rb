class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Define admin como falso por padrão
  after_initialize :set_default_admin, if: :new_record?

  private

  def set_default_admin
    self.admin ||= false
  end
end
