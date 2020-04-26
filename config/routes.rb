Rails.application.routes.draw do
  resources :vulnerable_zones
  delete 'vulnerable_zones/', to: 'vulnerable_zones#destroy'
end
