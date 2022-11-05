Rails.application.routes.draw do
  get 'resumo/:ano/:mes', to: 'receitas#resumo', as: 'receitas_resumo'

  resources :receitas do
    collection do
      get ':ano/:mes', to: 'receitas#mes', as: 'receitas_mes'
    end
  end
  resources :despesas do
    collection do
      get ':ano/:mes', to: 'despesas#mes', as: 'despesas_mes'
    end
  end
end
