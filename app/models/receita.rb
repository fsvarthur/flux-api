class Receita < ApplicationRecord
    validates :descricao, presence: true, length: {maximum: 50}
    validates :valor, presence: true, numericality: {greater_than: 0}
    validates :data, presence: true
end
