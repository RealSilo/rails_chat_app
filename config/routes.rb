Rails.application.routes.draw do
  root to: "chatrooms#index"
  resources :chatrooms do
    resource :chatroom_users
    resources :messages
  end

  resources :private_chatrooms

  devise_for :users, :controllers => { :registrations => 'users/registrations' }
end
