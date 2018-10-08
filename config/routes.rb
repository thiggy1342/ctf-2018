Rails.application.routes.draw do
  # authenticate :user do
  #   resources   resources :conversations do
  #     resources :messages
  #   end
  # end

  resources :conversations, only: [:new, :create, :show, :display_elements] do
    post 'display_elements' => 'conversations#display_elements', as: :display_elements
    post 'clear_history' => 'conversations#clear_history', as: :clear_history
    resources :messages, only: [:create, :show]
  end

  root 'conversations#new'
end
