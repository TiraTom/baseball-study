Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'ys_apps#index'

  get '/records', to: 'records#index', as: 'records'
  get '/players', to: 'players#index'
  get '/palyers/:id', to: 'players#show'
  get 'records/reload', to:'records#reload', as: 'records_reload'

end
