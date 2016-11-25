Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "people#index"
  resources :todos
  post 'todos/:id', to: 'todos#completed'
  mount ActionCable.server => '/cable'
  resources :rooms
  get '/rooms/show', to: 'rooms#show'
end
