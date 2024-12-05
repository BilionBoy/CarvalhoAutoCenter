class Roda < ApplicationRecord
  has_one_attached :imagem

  validates :categoria, presence: true, inclusion: { in: ["nova", "semi nova"] }


  def self.ransackable_attributes(auth_object = nil)
    ["categoria", "titulo", "descricao", "preco", "imagem", "created_at", "updated_at"]
  end

end
