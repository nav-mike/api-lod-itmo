Rails.application.routes.draw do
  root 'application#not_found'
  
  get '*unmatched_route', to: 'application#not_found'
end
