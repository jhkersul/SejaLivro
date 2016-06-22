Rails.application.routes.draw do

  devise_for :users, path_names: {
      sign_in: 'login', registration: 'cadastro'
  }

  resources :bookstores, :categories, :books
  resources :admin, :signature
  
  root 'main#index'

  get '/cadastro', to: 'users#new', as: 'users'  
  get '/logout', to: 'users#logout'
  get '/pagamento', to: 'signature#payment'
  get '/profile/:id/edit', to: 'users#edit', as: 'edit_user'    
  get 'profile/:id/address', to: 'address#edit', as: 'edit_address'  
  get '/profile/:id', to: 'users#profile', as: 'profile'
  get '/my_books/:id', to: 'users#my_books', as: 'my_books'
  get '/catalog' => 'books#catalog', as: 'books_catalog'
  get '/packages' => 'admin#packages', as: 'admin_packages'
  get '/boleto_payment' => 'signature#boleto_payment'
  get '/credit_card_payment' => 'signature#credit_card_payment'
  post '/cadastro', to: 'users#create'
  post 'bookstores/search' => 'bookstores#search', as: 'search_bookstores'
  post 'books/search' => 'books#search', as: 'search_books'
  post 'categories/search' => 'categories#search', as: 'search_categories'
  post '/credit_card_payment' => 'signature#process_payment_credit_card'
  post '/boleto_payment' => 'signature#process_payment_boleto'
  post '/cadastro' => 'users#create'

  post '/signature/cancel_signature/:id' => 'signature#cancel_signature'
  post '/users/delete_user/:id' => 'users#delete_user'

  post '/' => 'main#store_signature'

  patch '/profile/:id/edit', to: 'users#update', as: 'update_user'
  patch 'profile/:id/address', to: 'address#update', as: 'address_update'  

  delete 'profile/:id', to: 'users#destroy', as: 'delete_user'

end
