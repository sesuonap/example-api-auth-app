Rails.application.routes.draw do
  namespace :api do
    get '/articles' => 'pages#index'

    get '/spotify_authorize' => 'spotifys#authorize'
    get '/spotify/callback' => 'spotifys#callback'
    get '/spotify/me' => 'spotifys#account'
    get '/spotify/search' => 'spotifys#search'
    
  end 
end
