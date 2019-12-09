Rails.application.routes.draw do
 resources :articles

  root to: 'articles#new'
end
