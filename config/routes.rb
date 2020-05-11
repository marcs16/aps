Rails.application.routes.draw do

  
  resources :events
  resources :devices do
    collection {post :import}
    resources :maintainces
  end
  get 'welcome/index'
  get 'welcome/indexlog'
  resources :users,:only => [:new, :edit,:update]
  get 'users/index', to: 'users#index'
  get 'users/:id/edit', to: 'users#edit'
  put 'users/:id/update', to: 'users#update'
  get 'users/:id/reset_password', to: 'users#reset_password', as: 'users_reset_password'
  
  
	devise_for :users, controllers: {
  	registrations: 'users/registrations',
  	sessions: 'users/sessions',
  	passwords: 'users/passwords',
  }

  authenticated :user do
  	root "welcome#indexlog", as: "authenticated_root"
  end

  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
