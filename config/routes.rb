Rails.application.routes.draw do
# the priority is based upon order of creation: first created -> highest priority.
# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

# Root route
  root to: 'sessions#home'

# OAuth2 OmniAuth callbacks 
  get '/auth/github/callback', to: 'sessions#create' 

  #post '/auth/:provider/callback', to: 'sessions#create'
  #get '/auth/failure', to: 'sessions#failure'

# custom routes here above the default resourceful routes
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

#   examples custom routes Generated by: GitHub: CoPilot/rails_api_doc
  #   get 'examples/:id', to: 'examples#show', as: :example
  #   get 'custom_route_name', to: 'custom_route#custom_route_name'
  #   post 'custom_route_name', to: 'custom_route#custom_route_name'
  #   put 'custom_route_name', to: 'custom_route#custom_route_name'
  #   delete 'custom_route_name', to: 'custom_route#custom_route_name'
  #   patch 'custom_route_name', to: 'custom_route#custom_route_name'
  #   get 'custom_route_name/:id', to: 'custom_route#custom_route_name'
  #   post 'custom_route_name/:id', to: 'custom_route#custom_route_name'
  #   put 'custom_route_name/:id', to: 'custom_route#custom_route_name'
  #   delete 'custom_route_name/:id', to: 'custom_route#custom_route_name'
  #   patch 'custom_route_name/:id', to: 'custom_route#custom_route_name'
  #   get 'custom_route_name/:id/:action', to: 'custom_route#custom_route_name'


  # This Are the Default Resourceful Routes Generated by the resource generator
  resources :folders
  resources :tags
  resources :users 
  resources :bookmarks
end
