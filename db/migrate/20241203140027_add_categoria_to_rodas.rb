class AddCategoriaToRodas < ActiveRecord::Migration[7.1]
  def change
    add_column :rodas, :categoria, :string
  end
end
