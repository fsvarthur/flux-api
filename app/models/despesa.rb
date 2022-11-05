class Despesa < ApplicationRecord
    include Categoria

    validates :descricao, presence: true, length: { maximum: 50 }, uniqueness: {scope: :data, message: "Despesa ja cadastrada para esse mêss"}
    validates :valor, presence: true, numericality: { greater_than: 0 }
    validates :data, presence: true

    scope :filter_by_descricao, -> (descricao) { where("descricao like ?", "%#{descricao}%") }
end
