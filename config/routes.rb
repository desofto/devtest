Rails.application.routes.draw do
  root to: 'home#index'

  mount API::Private::Root => '/api/private/'
  mount API::Public::Root => '/api/public/'
end
