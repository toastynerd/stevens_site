RailsBlog::Application.routes.draw do
  devise_for :users

  resources :posts

  resources :pages

  root to: "posts#index"
end
