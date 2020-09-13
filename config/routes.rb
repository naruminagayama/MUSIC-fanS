Rails.application.routes.draw do
  mount ActionCable.server => '/cable'
  get 'favorites/controller'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_for :customers, controllers: {
    registrations: 'front/registrations',
    sessions: 'front/sessions'
  }

  devise_scope :customer do
    post 'front/guest_sign_in' => 'front/sessions#new_guest'
  end

  root 'homes#top'
  get '/homes/about' => 'homes#about'

  namespace :front do
    resources :customers
    get '/customers/:id/follower' => 'customers#follower', as: 'follower'
    get '/customers/:id/followed' => 'customers#followed', as: 'followed'
    get '/customers/:id/favoriteartist' => 'customers#favoriteartist', as: 'favoriteartist'
    get '/customers/:id/favoritesong' => 'customers#favoritesong', as: 'favoritesong'
    get '/customers/:id/customerblog' => 'customers#customerblog', as: 'customerblog'
    resources :artists, only: [:index, :show] do
      resource :favorite_artists, only: [:create, :destroy]
      collection do
        get 'search'
      end
    end
    resources :songs, only: [:index, :show] do
      collection do
        get 'search'
      end
      resource :favorite_songs, only: [:create, :destroy]
    end
    resources :communities, only: [:index, :show] do
      collection do
        get 'favorite_index'
      end
    end
    resources :blogs, except: [:new, :show]
    post 'follow/:id' => 'relationships#follow', as: 'follow' # フォローする
    post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow' # フォロー外す
  end

  get '*not_found' => 'application#routing_error'
  post '*not_found' => 'application#routing_error'

end