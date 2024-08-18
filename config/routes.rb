Rails.application.routes.draw do
  root 'deux_chevaux#index'
  post 'update', to: 'deux_chevaux#update'
  post 'reset', to: 'deux_chevaux#reset'
end
