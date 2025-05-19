class AddEntradaAndTipoPagamentoToVendas < ActiveRecord::Migration[7.1]
  def change
    add_column :vendas, :entrada, :boolean, null: false, default: true
    add_column :vendas, :tipo_pagamento, :string
  end
end
