Rails.application.routes.draw do
  resources :users, only: [] do
    resources :sleep_records, only: [:create, :index]
    get 'following_sleep_records', to: 'following_sleep_records#index'
  end

  resources :followers, only: [:create] do
    delete :unfollow, on: :collection
  end
end
