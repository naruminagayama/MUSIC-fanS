Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_for :customers, controllers: {
    registrations: 'public/registrations',
    sessions: 'public/sessions'
  }

  root 'public/homes#top'

  namespace :public do
  	resources :artists, only: [:index, :show]
  	resources :songs, only: [:index, :show]
  end

end
