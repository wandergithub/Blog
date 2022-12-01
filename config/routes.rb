Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get '/users', to: 'users#index', as: 'users'
  get '/users/:id', to: 'users#show'
  get '/users/:user_id/posts', to: 'posts#index'
  get '/users/:user_id/posts/:id', to: 'posts#show'
  get '/posts/new', to: 'posts#new', as: 'new_post'
  post '/posts/create', to: 'posts#create', as: 'create_post'
  # Defines the root path route ("/")
  # root "articles#index"
end
