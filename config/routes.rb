Rails.application.routes.draw do
  mount ActionCable.server => '/cable'
  get 'favorites/controller'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_for :customers, controllers: {
    registrations: 'public/registrations',
    sessions: 'public/sessions'
  }

  root 'homes#top'
  get '/homes/about' => 'homes#about'

  namespace :public do
    resources :customers
    get '/customers/:id/follower' => 'customers#follower', as: 'follower'
    get '/customers/:id/followed' => 'customers#followed', as: 'followed'
    get '/customers/:id/favoriteartist' => 'customers#favoriteartist', as: 'favoriteartist'
    get '/customers/:id/favoritesong' => 'customers#favoritesong', as: 'favoritesong'
    get '/customers/:id/blogs' => 'customers#blogs', as: 'customerblogs'
    resources :artists, only: [:index, :show] do
      resource :favorites, only: [:create, :destroy]
      collection do
        get 'search'
      end
    end
    resources :songs, only: [:index, :show] do
      collection do
        get 'search'
      end
      resource :favorite2s, only: [:create, :destroy]
    end
    resources :communities, only: [:index, :show]
    resources :blogs, except: [:new, :show]
    post 'follow/:id' => 'relationships#follow', as: 'follow' # フォローする
    post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow' # フォロー外す
  end

end