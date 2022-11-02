class Despesa < ApplicationRecord
    validates :descricao, presence: true, length: { maximum: 50 }, uniqueness: {scope: :month, message: "Despesa ja cadastrada para esse mêss"}
    validates :valor, presence: true, numericality: { greater_than: 0 }
    validates :data, presence: true
end
