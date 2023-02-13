Rails.application.routes.draw do
  devise_for :students, controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions',
    passwords: 'public/passwords'
  }
  scope module: :public do
    resources :students do
      member do
        get 'mypage'
      end
    end
    resources :articles
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
