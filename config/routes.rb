AdministrateTest::Application.routes.draw do
  namespace :admin do
    resources :users
    resources :categories
    resources :line_items
    resources :orders
    resources :products
    resources :roles

    root to: "users#index"
  end

  devise_for :users
end
