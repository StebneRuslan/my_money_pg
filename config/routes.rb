MyMoney::Application.routes.draw do
  devise_for :users

  get "persons/profile"

  get 'welcome' => 'welcome#index', :as => 'welcome'
  # root 'welcome#index'
  root :to => 'welcome#index'
  get 'persons/profile', as: 'user_root'
  resources :categories
  resources :balances
  get 'new_category' => 'categories#new', as: 'new_category'
  get 'edit_category' => 'categories#edit', as: 'edit_category'
  get 'edit_balance' => 'balances#edit', as: 'edit_balance'
  get 'get_balances' => 'balances#get_balances', as: 'get_balances'
end
