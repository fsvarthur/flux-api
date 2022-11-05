Rails.application.routes.draw do
  resources :receitas
  get 'receitas/:ano/:mes', to: 'receitas#mes', as: 'receitas_mes'
  resources :despesas
end
