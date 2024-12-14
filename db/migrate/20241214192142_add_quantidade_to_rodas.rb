class AddQuantidadeToRodas < ActiveRecord::Migration[7.1]
  def change
    add_column :rodas, :quantidade, :integer, default: 0, null: false
  end
end
