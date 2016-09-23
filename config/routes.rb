Rails.application.routes.draw do
  resources :customers, only: :index

  scope path: '/c/:tenant/' do
    use_doorkeeper do
      skip_controllers :applications, :authorized_applications
    end

    devise_for :users, skip: :omniauth_callbacks

    scope '/', module: :tenant do
      namespace :api do
        namespace :v1 do
          resource :user, only: :show
          resource :calendar, only: :show
          resources :reservations, only: [:index, :create] do
            collection do
              delete '/', to: 'reservations#destroy'
            end
          end
          resources :devices, only: [:create]
        end
      end

      root 'pages#landing'
    end
  end

  get '/place-for-your-company', to: 'pages#tenant_not_found', as: :tenant_not_found
  root 'pages#landing'
end
