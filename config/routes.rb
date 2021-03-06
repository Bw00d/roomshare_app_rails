RoomshareApp::Application.routes.draw do
  root to: 'users#home'

  devise_for :users, path_names: { sign_in: "login", sign_out: "logout" }
  resources :users, only: [:show] do
    resources :accomodations
  end
  resources :accomodations
end
