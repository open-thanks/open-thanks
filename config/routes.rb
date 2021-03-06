Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  devise_scope :user do
    get "/sign-out" => "devise/sessions#destroy", as: :sign_out
    #root 'receivers#index'
  end

  resources :users, only: :show
  resources :r, controller: 'receivers', as: :receivers do
    collection do
      get :latest
    end
    resources :appreciations, only: [:create, :destroy], shallow: true
  end

  #get '/auth/:provider/callback', to: 'sessions#create'

  root 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
