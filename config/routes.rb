Rails.application.routes.draw do
  resources :dns_entries
  get 'dns/new'
  #get 'login/new'

  root :to => "login#new"
  post "/login/create", to: 'login#create'
  delete "/logout", to: 'login#logout'
resources :dns

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
