Rails.application.routes.draw do
  get 'pages/legend'

  get 'pages/about'

  resources :risks


  root 'risks#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
