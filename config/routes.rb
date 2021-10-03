Rails.application.routes.draw do
  get '/users/', to: 'user#index'
  get '/users/:id', to: 'user#show'
  get '/register/',  to: 'register#index'
  post '/register/', to: 'register#createuser'
  # get {url address}, to: {controller name}#{controller function}
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end