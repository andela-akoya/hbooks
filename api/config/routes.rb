Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  scope module: :v1, constraints: ApiVersion.new('v1', true) do
    resources :books do
      post 'borrow', to: 'transactions#borrow'
      post 'return', to: 'transactions#return'
      post 'review', to: 'reviews#create'
      put 'borrow/transaction_id', to: 'transactions#borrow'
      put 'return/transaction_id', to: 'transactions#return'
      post 'favourites', to: 'favourites#create'
    end
    resources :users
    get 'favbooks', to: 'favourites#index'

  end
end
