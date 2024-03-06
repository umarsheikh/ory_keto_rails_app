Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resource :oauth, only: :new, controller: :oauth do
    member do
      get :callback
    end
  end
end
