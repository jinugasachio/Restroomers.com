Rails.application.routes.draw do
  devise_for :users
  root 'static_pages#top'

  # router.jsで指定してるパスはずべて下記のようにルートにリダイレクトさせることで
  # エラーを防げる、今の所は一つづつ書いてくしかないかなー？
  # もっとスマートな書き方があるはず。
  get 'post', to: 'static_pages#top'
  get 'room/:id', to: 'static_pages#top'


  namespace :api do
    resources :powder_rooms, defaults: { format: 'json' }
  end
end
