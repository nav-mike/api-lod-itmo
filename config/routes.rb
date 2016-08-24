Rails.application.routes.draw do

  get 'news/index'

  get 'news/show'

  resources :research_areas, only: %i(index show)
  resources :laboratories, only: %i(index show)
  resources :people, only: %i(index show)
  resources :applications, only: %i(index show create update destroy), constraints: {id: /[0-9]+/}
  resources :courses, only: %i(index show)
  get '/applications/key' => 'applications#key'

  # applications with key
  resources :applications, param: :key, only: %i(show update destroy), constraints: {key: /[a-zA-Z0-9]+/}
  
  get '/laboratories/:laboratory_id/people' => 'people#lab_index', constraints: {laboratory_id: /[0-9]+/, format: /json/}
  
  root 'application#not_found'
  
  get '*unmatched_route', to: 'application#not_found'
end
