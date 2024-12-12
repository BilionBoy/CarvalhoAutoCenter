class CreateVendas < ActiveRecord::Migration[7.1]
  def change
    create_table :vendas do |t|
      t.references :roda, null: false, foreign_key: true
      t.integer :quantidade, null: false
      t.decimal :preco_total, null: false, precision: 10, scale: 2

      t.timestamps
    end


    # Adiciona a exclusão em cascata
    add_foreign_key :vendas, :rodas, on_delete: :cascade
  end
end
