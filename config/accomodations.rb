tRoomshareApp::Application.routes.draw do
  root to: 'users#home'

  devise_for :users, path_names: { sign_in: "login", sign_out: "logout" }

  resources :accomodations
  resources :users, only: [:show]
end
