Rails.application.routes.draw do
  resources :customers, only: [:new, :create]

  scope path: '/c/:tenant/' do
    use_doorkeeper
    devise_for :users, skip: :omniauth_callbacks

    scope '/', module: :tenant do
      namespace :api do
        namespace :v1 do
          resources :users, only: :index
        end
      end

      root 'pages#landing'
    end
  end

  get '/place-for-your-company', to: 'pages#tenant_not_found', as: :tenant_not_found
  root 'pages#landing'
end
