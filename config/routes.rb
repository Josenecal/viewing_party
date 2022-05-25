Rails.application.routes.draw do
  get '/', to: 'landing_page#index'

  get '/register', to: 'users#new'

  post '/users', to: 'users#create'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/dashboard', to: 'dashboard#user_dashboard', as: :users_dashboard

  get '/movies/:id/viewing-party/new', to: 'parties#new'
  get '/movies/:id', to: 'movies#details'
  get '/movies', to: 'movies#results'
  get '/discover', to: 'movies#index'
  post '/movies/:id/viewing-party', to: 'parties#create'

end
