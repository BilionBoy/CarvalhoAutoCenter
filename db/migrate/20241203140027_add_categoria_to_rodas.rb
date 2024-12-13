class AddCategoriaToRodas < ActiveRecord::Migration[7.0]
  def change
    # Evitar erro de coluna duplicada
    unless column_exists?(:rodas, :categoria)
      add_column :rodas, :categoria, :string
    end
  end
end
