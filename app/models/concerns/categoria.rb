module Categoria
    extend ActiveSupport::Concern

    CATEGORIAS = ['Alimentação','Saúde','Moradia','Transporte','Educação','Lazer','Imprevistos']

    included do
        validates :categoria, inclusion: {in: CATEGORIAS}
    end

    def saude?
        categoria == 'Saúde'
    end
end