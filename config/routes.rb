Rails.application.routes.draw do
  resources :research_areas, only: %i(index show)
  resources :laboratories, only: %i(index show)
  resources :people, only: %i(index show)
  
  root 'application#not_found'
  
  get '*unmatched_route', to: 'application#not_found'
end
