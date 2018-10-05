Rails.application.routes.draw do
  # authenticate :user do
  #   resources   resources :conversations do
  #     resources :messages
  #   end
  # end

  resources :conversations, only: [:new, :create, :show] do
    resources :messages, only: [:create, :show]
  end

  root 'conversations#new'
end
