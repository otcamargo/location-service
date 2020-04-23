Rails.application.routes.draw do
  resources :vulnerable_zones
  delete 'vulnerable_zones/:cep', to: 'vulnerable_zones#destroy'

end
