Rails.application.routes.draw do
  
  
  devise_for :users, controllers: { registrations: 'users/registrations',:sessions => 'users/sessions' }
  resources :users, only: [:show]

  

  devise_scope :user do
    get "sign_in", :to => "users/sessions#new"
    get "sign_out", :to => "users/sessions#destroy" 
  end
 
  get 'user1s/:id/edit' => 'users/registrations#edit'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'ouchis#index'
  get 'ouchis' => 'ouchis#index'
  get 'ouchis/:id' => 'ouchis#show',as: 'ouchi'
  get 'ideas/:id' => 'ideas#new',as: 'idea'
  resources :ouchis do
    resources :ideas, only: [:new, :create, :index]
  end


resources :ideas do
  resource :likes, only: [:create, :destroy]
end

get 'user1s/:id' => 'user1s#show',as: 'mypage'


end
