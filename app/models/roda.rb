class Roda < ApplicationRecord
  has_one_attached :imagem
  
  validates :categoria, presence: true, inclusion: { in: ["nova", "semi nova"] }
end
