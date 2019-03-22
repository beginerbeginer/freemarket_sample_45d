Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    omniauth_callbacks: "users/omniauth_callbacks"
  }

  devise_scope :user do
    get 'complete' => 'users/registrations#complete'
  end

  root 'products#index'

  resources :users, only: [:index, :new, :show, :edit] do
    resources :listings, only:[:index, :update, :show, :destroy], shallow:true do
      collection do
        get 'in_progress'
        get 'solds'
      end
    end
  end
  resources :payments, only:[:index, :new, :create, :show, :destroy]
  resources :mypages, only:[:index]
  resources :profiles, only: [:new, :create, :edit, :update]
  resources :products, only: [:new, :create, :show, :index] do
    resources :purchases, only: [:new, :create]
    resources :likes, only: [:create, :destroy]
  end
  resources :categories, only: [:new, :show]
end

