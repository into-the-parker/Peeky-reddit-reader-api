Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace 'api' do
    namespace 'v1' do
      get 'articles' => 'articles#index'
      get 'reads' => 'reads#index'
      post 'reads' => 'reads#create_read_later'
      delete 'reads' => 'reads#destroy'
    end
  end
end
