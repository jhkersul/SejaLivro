Rails.application.routes.draw do

  devise_for :users, path_names: {
      sign_in: 'login', registration: 'cadastro'
  }

  resources :bookstores

  resources :categories

  resources :books

  resources :users

  root 'main#index'

  get '/cadastro', to: 'users#cadastro'
  get '/logout', to: 'users#logout'
  get '/assinatura', to: 'main#assinatura'
  get '/profile/:id', to: 'users#profile'
  get '/my_books/:id', to: 'users#my_books'
  get '/book/:id', to: 'books#show'
  get '/admin/:id', to: 'admins#index'
  get '/users/', to: 'users#index'
  get "/bookstores/new", to: "bookstores#create"
  get '/bookstores/', to: "bookstores#index"
  get '/bookstores/:id/view', to: "bookstores#show"
  get '/bookstores/:id/edit', to: "bookstores#edit"
  get '/bookstores/:id/del', to: "bookstores#destroy"
  #Categories
  get "/categories/new", to: "categories#create"
  get '/categories/', to: "categories#index"
  get '/categories/:id/view', to: "categories#show"
  get '/categories/:id/edit', to: "categories#edit"
  get '/categories/:id/del', to: "categories#destroy"

  post 'bookstores/search' => 'bookstores#search', as: 'search_bookstores'
  post 'books/search' => 'books#search', as: 'search_books'
  post 'categories/search' => 'categories#search', as: 'search_categories'


end
