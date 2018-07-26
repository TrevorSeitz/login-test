Rails.application.routes.draw do
  resources :users
  resources :identities
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#home'
  get '/signout' => 'sessions#destroy', :as => :signout
  get '/logout' => 'sessions#destroy', :as => :logout
  get '/auth/github/callback' => 'sessions#create'
  match '/auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
end
