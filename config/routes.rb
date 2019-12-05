Rails.application.routes.draw do

  resources :invitations
  resources :event_items
  resources :items
  resources :events
  devise_for :users
  get 'participating', to: 'events#participating', as: 'participating'
  get 'configs', to: 'user#configs', as: 'user_configs'
  patch 'configs', to: 'user#upload_avatar'
  get 'accept/invitation/:id', to: 'invitations#accept', as: 'accept_invities'
  get 'viewed_invitation/:id', to: 'invitations#viewed_invitation', as: 'viewed_invitation'
  patch 'event_item_status/:id', to: 'event_items#charge_status', as: 'charge_status'
  root to: 'dashboard#index'

  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      mount_devise_token_auth_for 'User', at: 'auth'
      resources :users, only: [:show, :create, :update, :destroy]
       resources :invitations
        resources :event_items
        resources :items
        resources :events
        get 'participating', to: 'events#participating'
        get 'configs', to: 'user#configs'
        patch 'configs', to: 'user#upload_avatar'
        get 'accept/invitation/:id', to: 'invitations#accept'
        get 'viewed_invitation/:id', to: 'invitations#viewed_invitation'
        get '/', to:'dashboard#index'
    end
  end
end
