class CreateRodas < ActiveRecord::Migration[7.1]
  def change
    create_table :rodas do |t|
      t.string :titulo
      t.text :descricao
      t.decimal :preco
      t.string :imagem

      t.timestamps
    end
  end
end
