Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [:index, :update, :new, :show, :ranking, :create] do
    patch 'choose_winner', on: :member
    get 'ranking', on: :collection
  end

  root 'users#index'

end
