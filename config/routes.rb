Rails.application.routes.draw do

  get "up" => "rails/health#show", as: :rails_health_check

  root to: 'games#new'
  get '/new', to: "games#new"
  post '/score', to: "games#score"
end
