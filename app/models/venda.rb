class Venda < ApplicationRecord
  belongs_to :roda

  validates :quantidade, presence: true, numericality: { greater_than: 0 }
  validates :preco_total, presence: true, numericality: { greater_than: 0 }
end
