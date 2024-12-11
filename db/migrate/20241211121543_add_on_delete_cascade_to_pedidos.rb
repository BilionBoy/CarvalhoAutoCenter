class AddOnDeleteCascadeToPedidos < ActiveRecord::Migration[7.1]
  def change
    remove_foreign_key :pedidos, :rodas  # Remover a restrição atual
    add_foreign_key :pedidos, :rodas, on_delete: :cascade  # Adicionar a nova com CASCADE
  end
end
