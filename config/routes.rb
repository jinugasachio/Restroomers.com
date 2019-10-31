# require 'devise_token_auth'
Rails.application.routes.draw do
  root 'static_pages#top'

  # router.jsで指定してるパスはずべて下記のようにルートにリダイレクトさせることで
  # エラーを防げる、今の所は一つづつ書いてくしかないかなー？
  # もっとスマートな書き方があるはず。
  # get 'post', to: 'static_pages#top'
  # get 'room/:id', to: 'static_pages#top'

  namespace :api, format: 'json' do
    mount_devise_token_auth_for 'User', at: 'auth', controllers: {
      registrations: 'api/auth/registrations'
    }
    resources :powder_rooms
    resources :reviews, only: [:index, :create, :destroy]
    resources :likes,   only: [:create, :destroy] do
      collection do
        get 'favorite_rooms'
      end
    end
  end
end
