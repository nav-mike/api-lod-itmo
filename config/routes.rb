Rails.application.routes.draw do
  resources :laboratories, only: %i(index show)
  
  root 'application#not_found'
  
  get '*unmatched_route', to: 'application#not_found'
end
