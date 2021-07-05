Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
    root "static_pages#home"
    get "/signup", to: "users#new"
    get "/login", to: "login_session#new"
    post "/login", to: "login_session#create"
    delete "/logout", to: "login_session#destroy"
    resources :products, only: :index
    resources :users
    namespace :admin do
      root to: "admin#home"
      resources :products
      get "/login", to: "admin_session#new"
      post "/login", to: "admin_session#create"
      delete "/logout", to: "admin_session#destroy"
    end
  end
end
