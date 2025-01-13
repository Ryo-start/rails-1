Rails.application.routes.draw do
  # resources :tasksと重複するため、以下の２行をコメントアウト
    # get 'tasks/index'
    # get 'tasks/new'
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # 以下を追記
    resources :tasks # ルーティングをまとめて設定
    root to: 'tasks#index' # トップページの設定
  end
  