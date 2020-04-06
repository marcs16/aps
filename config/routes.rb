Rails.application.routes.draw do

  

  resources :devices do
    collection {post :import}
    resources :maintainces
  end
  get 'welcome/index'
  get 'welcome/indexlog'
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
