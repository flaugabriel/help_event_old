Rails.application.routes.draw do
  resources :invitations
  resources :event_items
  resources :items
  resources :events
  devise_for :users
  get 'accept/invitation/:id', to:'invitations#accept', as: 'accept_invities'
  get 'participating', to: 'events#participating', as: 'participating'
  get 'viewed_invitation/:id', to: 'invitations#viewed_invitation', as: 'viewed_invitation'

  root to: 'dashboard#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
