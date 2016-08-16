Rails.application.routes.draw do
  resources :research_areas, only: %i(index show)
  resources :laboratories, only: %i(index show)
  resources :people, only: %i(index show)
  
  get '/laboratories/:laboratory_id/people' => 'people#lab_index', constraints: {laboratory_id: /[0-9]+/, format: /json/}
  
  root 'application#not_found'
  
  get '*unmatched_route', to: 'application#not_found'
end
