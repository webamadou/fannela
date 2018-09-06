Rails.application.routes.draw do

  resources :themes
  resources :categories
  #devise_for :users
  root to: 'events#index'

  resources :events
  resources :countries
  get 'get_dataset', to: 'events#get_dataset'

=begin
  devise_for :users do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
=end
  devise_for :users, controllers: {
      :omniauth_callbacks => 'users/omniauth_callbacks'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
