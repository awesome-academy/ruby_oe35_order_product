Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
    root "static_pages#home"
    get "/signup", to: "users#new"
    get "/login", to: "login_session#new"
    post "/login", to: "login_session#create"
    delete "/logout", to: "login_session#destroy"
    resources :users
  end
end
