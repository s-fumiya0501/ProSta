Rails.application.routes.draw do
  get 'relationships/followings'
  get 'relationships/followers'
  devise_for :students, controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions',
    passwords: 'public/passwords'
  }
  scope module: :public do
    resources :students do
      collection do
        get 'mypage'
        get "detail"
      end
      resource :relationships, only: [:create, :destroy]
      get 'followings' => 'relationships#followings', as: 'followings'
      get 'followers' => 'relationships#followers', as: 'followers'
    end
    resources :articles do
      get 'get_tag_search', on: :collection, defaults: { format: 'json' }
      get 'get_tag_search', on: :member, defaults: { format: 'json' }
    end

    resources :learnings do
      collection do
        post :confirm
      end
      
    end
  end

  
  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, controllers: {
    sessions: "admin/sessions",
    passwords: "admin/passwords"
  }
  root :to => 'public/homes#top'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
