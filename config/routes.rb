Rails.application.routes.draw do
  resources :customers, only: [:new, :create]

  scope module: 'tenant', path: '/c/:tenant/' do
    devise_for :users

    root 'pages#landing'
  end

  get '/place-for-your-company', to: 'pages#tenant_not_found', as: :tenant_not_found
  root 'pages#landing'
end
