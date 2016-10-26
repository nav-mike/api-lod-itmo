Rails.application.routes.draw do
  # find by uri
  get '/research_areas/find_by_uri' => 'research_areas#find_by_uri', format: /json/

  resources :research_areas, only: %i(index show)
  resources :laboratories, only: %i(index show)
  resources :people, only: %i(index show)
  resources :applications, only: %i(index show create update destroy), constraints: {id: /[0-9]+/}
  resources :courses, only: %i(index show)
  resources :news, only: %i(index show)
  get '/applications/key' => 'applications#key'
  
  get '/publications/projects/:project_id' => 'publications#projects', constraints: {id: /[0-9]+/}, format: /json/

  # applications with key
  resources :applications, param: :key, only: %i(show update destroy), constraints: {key: /[a-zA-Z0-9]+/}
  
  get '/laboratories/:laboratory_id/people' => 'people#lab_index', constraints: {laboratory_id: /[0-9]+/, format: /json/}
  
  root 'application#not_found'
  
  get '*unmatched_route', to: 'application#not_found'
end
