class CreateVendas < ActiveRecord::Migration[7.1]
  def change
    create_table :vendas do |t|
      t.string :descricao
      t.decimal :valor
      t.date :data
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
