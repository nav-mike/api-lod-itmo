Rails.application.routes.draw do

  resources :research_areas, only: %i(index show)
  resources :laboratories, only: %i(index show)
  resources :people, only: %i(index show)
  resources :applications, only: %i(index show create update destroy), constraints: {id: /[0-9]+/}

  # applications with key
  resources :applications, param: :key, only: %i(show update destroy), constraints: {key: /[a-zA-Z0-9]+/}
  
  root 'application#not_found'
  
  get '*unmatched_route', to: 'application#not_found'
end
