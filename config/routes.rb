Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :conversations, only: [:index, :new, :create, :show] do
    resources :messages, only: [:create]
  end

  root 'conversations#index'
end
