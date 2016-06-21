Rails.application.routes.draw do

  devise_for :users, path_names: {
      sign_in: 'login', registration: 'cadastro'
  }

  resources :bookstores, :categories, :books
  resources :admin
  #resources :address, only: :update

  root 'main#index'

  get '/cadastro', to: 'users#new', as: 'users'
  get '/logout', to: 'users#logout'
  get '/pagamento', to: 'signature#payment'
  get '/profile/:id/edit', to: 'users#edit', as: 'edit_user'
  delete 'profile/:id', to: 'users#destroy', as: 'delete_user'
  get 'profile/:id/address', to: 'address#edit', as: 'edit_address'
  patch 'profile/:id/address', to: 'address#update', as: 'address_update'  
  get '/profile/:id', to: 'users#profile', as: 'profile'
  get '/my_books/:id', to: 'users#my_books', as: 'my_books'
  get '/catalog' => 'books#catalog', as: 'books_catalog'

  post 'bookstores/search' => 'bookstores#search', as: 'search_bookstores'
  post 'books/search' => 'books#search', as: 'search_books'
  post 'categories/search' => 'categories#search', as: 'search_categories'


  post '/' => 'main#store_signature'

end
