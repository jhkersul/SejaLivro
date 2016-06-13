Rails.application.routes.draw do

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

end
