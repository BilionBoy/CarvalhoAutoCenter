class Roda < ApplicationRecord
  has_one_attached :imagem

  validates :categoria, presence: true, inclusion: { in: ["nova", "semi nova"] }
  validates :preco, numericality: { greater_than_or_equal_to: 0 }

  def self.ransackable_attributes(auth_object = nil)
    ["categoria", "titulo", "descricao", "preco", "created_at", "updated_at"]
  end
end
