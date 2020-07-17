Rails.application.routes.draw do
  resources :zip_codes
  delete 'zip_codes/', to: 'zip_codes#destroy'
end
