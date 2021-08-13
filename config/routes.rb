Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  resources :notifications
  resources :vacations
  resources :salaries do
    get '/try_salary', to: 'salaries#try_salary', as: 'try_salary', on: :collection
  end
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
    get '/devices.xls', to: 'devices#report_devices', as: 'export', on: :collection
    collection {post :import}
    resources :maintainces do
      get '/device_maintainces.xls', to: 'maintainces#export_maintainces', as: 'export', on: :collection
    end
  end

  resources :users,:only => [:edit,:update]
  get 'users/index', to: 'users#index'
  get 'users/disabled_users_index', to: 'users#disabled_users_index', as: 'disabled_users_index'
  get 'users/:id/edit', to: 'users#edit'
  put 'users/:id/update', to: 'users#update'
  get 'users/:id/reset_password', to: 'users#reset_password', as: 'users_reset_password'
  get 'users/:id/disable_user', to: 'users#disable_user', as: 'user_disable'
  get 'users/:id/enable_user', to: 'users#enable_user', as: 'user_enable'


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
