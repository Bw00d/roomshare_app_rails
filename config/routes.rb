RoomshareApp::Application.routes.draw do
  root to: 'users#home'
  devise_for :users

end
