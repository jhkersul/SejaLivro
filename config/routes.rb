Rails.application.routes.draw do

  devise_for :users
  resources :bookstores

  resources :categories

  resources :books

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Rotas para o usuario
  resources :users do
    collection do
      get 'register'
    end
  end

  root "main#index"

  get '/assinatura', to: 'main#assinatura'
  get '/cadastro', to: 'users#cadastro'
  get '/profile/:id', to: 'users#profile'

end
