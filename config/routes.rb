HealthTracker::Application.routes.draw do
  resources :entries

  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#splash"
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :users, :only => [:show, :index]
  
end
