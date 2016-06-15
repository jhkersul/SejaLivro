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
  get '/login', to: 'users#login'
  get '/logout', to: 'users#logout'
  get '/assinatura', to: 'main#assinatura'
  get '/profile/:id', to: 'users#profile'
  get '/my_books/:id', to: 'users#my_books'
  get '/book/:id', to: 'books#show'
  get '/admin/:id', to: 'admins#index'
  get '/users/', to: 'users#index'

end
