Rails.application.routes.draw do

  resources :contracts
  get 'welcome/index'
  get 'welcome/indexlog'
  resources :application do     
    get 'application/current_language', to: 'application#current_language', as: 'c_language', on: :collection
  end
  resources :languages do
      get '/change_language', to: 'languages#change_language', as: 'change_language', on: :collection

      get '/current_language', to: 'languages#current_language', as: 'c_language', on: :collection
  end

 
  resources :events
  resources :devices do
    collection {post :import}
    resources :maintainces
  end

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
