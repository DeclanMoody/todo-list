Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "people#index"
  resources :todos
  post 'todos/:id', to: 'todos#completed'
  mount ActionCable.server => '/cable'
  resources :rooms
  get '/rooms/show', to: 'rooms#show'
  get '/guesses/show', to: 'guesses#show'
  resources :guesses
  resources :ai_guesses do
    collection do
      get :low
      get :high
      get :correct
    end
  end
  get '/ai_guesses/show', to: 'ai_guesses#show'
end
