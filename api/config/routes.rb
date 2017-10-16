Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  scope module: :v1, constraints: ApiVersion.new('v1', true) do
    resources :books, :users
    resources :users, only: [] do
      post 'borrow/:book_id', to: 'transactions#borrow'
      post 'return/:book_id', to: 'transactions#return'
      put 'borrow/:book_id', to: 'transactions#borrow'
      put 'return/:book_id', to: 'transactions#return'
      post 'review/:book_id', to: 'reviews#create'
      post 'fav/:book_id', to: 'favourites#create'
      get 'favbooks/:book_id', to: 'favourites#index'
    end
  end
end
