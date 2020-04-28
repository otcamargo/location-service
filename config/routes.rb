Rails.application.routes.draw do
  resources :people

  get 'vulnerable_zones/', to: 'vulnerable_zones#index'
  post 'vulnerable_zones/', to: 'vulnerable_zones#create'
  delete 'vulnerable_zones/:cep', to: 'vulnerable_zones#destroy'

  delete 'people/', to: 'people#destroy'
end
