Rails.application.routes.draw do
  resources :cobas
  resources :products
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get '/index', to: "root#index"
  get '/contact', to: "root#about"
  get '/about', to: "root#about"
  get '/response', to: "root#api"
  get '/user/:id/:name', to: "root#user"
  post '/add', to: "root#add"
  # delete '/delete/:id', to: "root#delete"

  get '/new', to: 'products#new'
  get '/detail/:id', to: 'products#detail'
  get '/list', to: "products#list"
  post '/addprod', to: "products#add"
  post '/delete/:id', to: "products#delete"
  root "products#new"
end
