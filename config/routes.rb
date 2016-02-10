Rails.application.routes.draw do
  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root to: 'home#index'

  post 'chores/:id/complete', to: 'chores#complete', as: 'complete_chore'

end
