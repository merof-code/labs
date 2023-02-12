Rails.application.routes.draw do
  get 'home/index'
  get 'home/dashboard'
  devise_for :users
  root to: "home#index"
  resources :borrow_extensions
  resources :extension_reasons
  resources :borrows
  resources :books
  resources :book_links
  resources :book_publishers
  resources :book_titles
  resources :publishers
  resources :authors
  resources :cards
  resources :users
  resources :permissions
  resources :roles
  resources :departments
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
end
