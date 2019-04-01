Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace 'api' do
    namespace 'v1' do
      resources :articles, :users, :sessions
      post 'login' => 'sessions#find'
      post 'users' => 'users#create'
      post 'user_token' => 'user_token#create'
      post 'find_user' => 'users#find'
    end
  end
end
