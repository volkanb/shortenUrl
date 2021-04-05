Rails.application.routes.draw do
  root 'urls#new'
  resources :urls, only: [:new, :create, :show]
  get '/urls/:short_url', to: 'urls#show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
