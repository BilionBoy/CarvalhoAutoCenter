class AddQuantidadeToRodas < ActiveRecord::Migration[7.1]
  def change
    unless column_exists?(:rodas, :quantidade)
      add_column :rodas, :quantidade, :integer, default: 0, null: false
    end
  end
end
