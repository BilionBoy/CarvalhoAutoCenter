class CreatePedidos < ActiveRecord::Migration[7.1]
  def change
    create_table :pedidos do |t|
      t.string :nome
      t.string :telefone
      t.string :email
      t.references :roda, null: false, foreign_key: { on_delete: :cascade } # Adicionando a opção on_delete: :cascade
      t.string :status

      t.timestamps
    end
  end
end
