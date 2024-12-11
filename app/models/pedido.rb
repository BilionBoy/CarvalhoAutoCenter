class Pedido < ApplicationRecord
  belongs_to :roda

  validates :nome, :telefone, :email, :roda_id, presence: true
end
