# Gemとは 
誰かが作成したパッケージ（プログラムで便利な機能をまとめたもの）のこと。一から作らなくても、gemをインストールするだけで効率よく開発することが可能。  

# Gemの探し方 
<a>https://rubygems.org/</a>からGemパッケージを検索可能。自作のGemを公開できる。  
<a>https://bestgems.org/</a>で、ダウンロード数が多い人気のGemを確認できる。

# Gemの具体例
## Devise
ユーザー認証に必要なほぼ全ての機能（サインアップ、サインイン、ログアウト、パスワードリセット、メール認証など）を簡単に導入できるRails用のGem。ビュー、ルーティング、コントローラは自由にカスタマイズ可能。
### Deviseの導入手順
#### Gemfileにでdeviseを追加してインストール
`gem "devise"`  
`bundle install` # gemのインストール 
#### Deviseインストール 
`bin/rails g devise:install`  
#### Devise設定 
実行後、初期設定のための手順や注意点が表示される（以下）。  
- デフォルトURLの指定（config/environments/development.rbに、`config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }`を追加）
- root_urlの指定（`bin/rails g controller Pages index show`でPagesコントローラとindexページとshowページを追加し、config/routes.rbに`root 'pages#index'`と`get 'pages/show'`を指定）
- flashメッセージの設定（app/views/layouts/application.html.erbに、`<p class="notice"><%= notice %></p>`と`<p class="alert"><%= alert %></p>`を追加）
- deviseのビューを生成（bin/rails g devise:views）

#### Userモデルとマイグレーションファイル作成  
`bin/rails g devise User`
db/migrateに、TIMESTAMP_devise_create_user.rbが生成されるため、カラムを追加したい場合はマイグレーションファイルを編集する。
#### マイグレーション実行 
`bin/rails db:migrate`
#### ルーティング追加 
config/routes.rbに、devise_for :userが自動追記されているか確認する。  
必要に応じてコントローラやパスをカスタマイズする場合は、`devise_for :user, controllers: { sessions: 'user/sessions', registractions: 'user/registractions' }`のように書く。  
#### ビュー作成 
実行後、app/views/devise配下に各種viewファイルが作成されるため、編集する。  
#### 動作確認 
`bin/rails s`でサーバー起動し、以下のブラウザにアクセスする。  
- http://localhost3000/users/sign_up（新規登録ページ）  
- http://localhost3000/users/sign_in（ログインページ）  
ユーザー登録やログイン後、トップページ（root_path）にリダイレクトされるか確認する。

### Deviseの日本語対応にする手順 
#### devise-i18nをインストール 
Deviseの日本語化にはdevise-i18nというgemの使用が一般的だが、devise以外にも日本語対応させたい場合は`rails-i18n`というgemをGemfileに一緒に追加する。  
`gem "devise-i18n"`  
`bundle install`
#### 日本語の言語ファイルを確認 
devise-i18nインストール後、日本語翻訳ファイルが自動的に使われるようになる。<a>https://gist.github.com/satour/6c15f27211fdc0de58b4</a>より、日本語対応のdevise用のdevise.ja.ymlをコピーしたらよい。
#### Railsのデフォルトロケールを日本語に設定 
config/applicaion.rb  
```
module YourAppName
  class Application < Rails::Application
    config.i18n.default_locale = :ja
  end
end

```


# 参考 
<a>https://qiita.com/ayamo/items/ef3cad7827f525f4fde6</a>  
<a>https://qiita.com/Taira0222/items/217668f58a7e72d33ba3</a>  
<a>https://qiita.com/cigalecigales/items/16ce0a9a7e79b9c3974e</a>  
<a>https://github.com/heartcombo/devise</a>
