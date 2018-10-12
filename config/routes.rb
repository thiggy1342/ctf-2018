Rails.application.routes.draw do
  # authenticate :user do
  #   resources   resources :conversations do
  #     resources :messages
  #   end
  # end

  resources :conversations, only: [:new, :create, :show, :display_elements, :messages_as_json] do
    get 'messages_as_json' => 'conversations#messages_as_json', as: :messages_as_json
    post 'display_elements' => 'conversations#display_elements', as: :display_elements
    post 'clear_history' => 'conversations#clear_history', as: :clear_history
    resources :messages, only: [:create, :show]
  end

  root 'conversations#new'
end
