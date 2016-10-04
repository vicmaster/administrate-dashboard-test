AdministrateTest::Application.routes.draw do
  namespace :admin do
    localized do
      resources :orders
      resources :users
      resources :categories
      resources :line_items
      resources :products
      resources :roles
    end

    root to: "users#index"
  end

  devise_for :users
end
