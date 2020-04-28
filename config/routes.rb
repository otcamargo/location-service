Rails.application.routes.draw do
  resources :vulnerable_zones, :people
  delete 'vulnerable_zones/', to: 'vulnerable_zones#destroy'
  delete 'people/', to: 'people#destroy'
end
