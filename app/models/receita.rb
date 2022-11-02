class Receita < ApplicationRecord
    validates :descricao, presence: true, length: {maximum: 50}, uniqueness: {scope: :data, message:"Receita já cadastrada para este mês"}
    validates :valor, presence: true, numericality: {greater_than: 0}
    validates :data, presence: true
end
