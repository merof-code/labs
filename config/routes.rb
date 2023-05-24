Rails.application.routes.draw do
  devise_for :users
  get 'home/index'
  get 'home/dashboard'
  root to: "home#index"

  # concern :searchable do
  #   collection do
  #     get 'search(/:id)', action: 'search', as: 'search'
  #   end
  # end

  resources :books
  resources :users
  resources :groups
  resources :physical_books
  resources :authors
  resources :publishers
  resources :faculties
  resources :borrows
  resources :borrow_extensions
  resources :extension_reasons
  resources :cards
  
  resources :permissions
  resources :roles
  resources :departments

  resources :librarians
  resources :professors
  resources :students
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
end
