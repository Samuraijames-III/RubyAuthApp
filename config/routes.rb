Rails.application.routes.draw do
  get '/users/', to: 'user#index'
  get '/users/:id', to: 'user#show'
  get '/register/',  to: 'register#index'
  get '/checkuser/', to: 'user#validate'
  post '/register/', to: 'register#createuser'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  get '/', to: 'home#index' 
  # get {url address}, to: {controller name}#{controller function}
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end