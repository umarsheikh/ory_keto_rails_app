Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: "home#index"
  resource :oauth, only: :new, controller: :oauth do
    member do
      get :callback
    end
  end

  namespace :ory do
    get :permissions, to: "permissions#index"
    get 'check-permissions', to: "permissions#check"
    post 'verify-permissions', to: "permissions#verify"
    get :identities, to: "identities#index"
  end
end
