class Venda < ApplicationRecord
  belongs_to :user

  TIPOS_PAGAMENTO = %w[dinheiro pix credito debito]

  validates :descricao, presence: true
  validates :valor, presence: true
  validates :data, presence: true
  validates :tipo_pagamento, inclusion: { in: TIPOS_PAGAMENTO }


end
