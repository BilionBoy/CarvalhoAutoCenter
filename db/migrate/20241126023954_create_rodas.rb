class CreateRodas < ActiveRecord::Migration[7.1]
  def change
    create_table :rodas do |t|
      t.string :titulo
      t.text :descricao
      t.decimal :preco, precision: 10, scale: 2
      t.string :categoria
      t.integer :quantidade, default: 0 # Se quiser adicionar o estoque

      t.timestamps
    end
  end
end
