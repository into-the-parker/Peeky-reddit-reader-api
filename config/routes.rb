Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace 'api' do
    namespace 'v1' do
      resources :articles, :users, :sessions
      post 'login' => 'sessions#find'
      post 'users' => 'users#create'
    end
  end
end
