Rails.application.routes.draw do

  devise_for :users, path_names: {
      sign_in: 'login', registration: 'cadastro'
  }

  resources :bookstores, :categories, :books, :users
  resources :admin

  root 'main#index'

  get '/cadastro', to: 'users#new'
  get '/logout', to: 'users#logout'
  get '/profile/:id/edit', to: 'users#edit'
  get '/profile/:id', to: 'users#profile'
  get '/my_books/:id', to: 'users#my_books'  

  post 'bookstores/search' => 'bookstores#search', as: 'search_bookstores'
  post 'books/search' => 'books#search', as: 'search_books'
  post 'categories/search' => 'categories#search', as: 'search_categories'

end
