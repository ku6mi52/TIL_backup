# Render

## Renderとは
アプリケーションの公開、運用を行うためのプラットフォームを提供するサービス。

##  デプロイ手順
### 0.事前準備
- ローカル環境でWebアプリを開発済
- Renderにアカウント登録し、GitHubと連携
- PostgreSQLをインストール済
- GitHubにコードを連携済

### 1.アプリ設定
1. PostgreSQLを使用できるように、Gemを追加する。  
```
group :production do
  gem 'pg'
end
```

gem追加後、bundle install --without productionを実行。
2. Render用の設定ファイルを追加  
binフォルダに、`render-build.sh`ファイルを手動作成し、下記を記述する。  
```
#!/usr/bin/env bash 
# exit on error
set -o errexit

bundle install
bundle exec rake assets:precompile
bundle exec rake assets:clean
bundle exec rake db:migrate
bundle exec rails db:seed
```

chmod a+x bin/render-build.sh を実行し、権限付与。

3. DBの設定を変更するため、`config/database.yml`を編集する  
```
development:
  # 中略
  database: [アプリ名]_development

test:
  # 中略
  database: [アプリ名]_test
```

4. Gemfile.lockの設定を変更する  
bundle lock --add-platform x86_64-linux  

5. アプリをクローン作成していない場合は、GitHubへプッシュする。  

6. `config/credentials.yml.enc`を削除し、秘密情報管理用ファイルを作成する。  
EDITOR="vi" bin/rails credentials:edit  
実行後、`config/credentials.yml.enc`と`config/master.key`が生成されていることを確認。  
（補足）  
credentials.yml.enc・・・APIキーなどの機密情報を扱うファイル  
master.key・・・credential.ymlの復号用の鍵。gitignoreに入れておく。

### 2.RenderでDB作成
- <a>https://render.com/</a>にログインし、ヘッダーの「+ New」ボタンをクリック
- PostgreSQLを選択し、DB名（[アプリ名]_production）を入力 + リージョンをOhioに変更 + Instance TypeをFreeに変更 → Create Databaseをクリックすると、DB作成が開始される（StatusがAvailableに変更されるとDB作成完了）
- Internal Database URLをコピーし、保管する。  

### 3.Renderでアプリ作成
- ヘッダーの「+ New」ボタンをクリックし、Web Serviseを選択。
- GitHubのデプロイしたいリポジトリを選択。
- Name欄にアプリケーション名を入力（_は使用しない）
- LanguageをRubyに変更 + リージョンをOhioに変更。
- 初期状態で入力されているコマンドを削除して、Build Commandに「./bin/render-build.sh」、Start Commandに「bundle exec puma -C config/puma.rb」を入力
- Instance TypeをFreeに変更
- 環境変数を設定（マスターキー）：`config/master.key`の内容をコピーし、RenderのRAILS_MASTER_KEY項目の右側にペースト。
- 環境変数を設定（データベースURL）：Add Environment Variable」のボタンをクリックし、環境変数を追加する。（左側に「DATABASE_URL」と入力 + 右側にデータベース作成時にコピーした「Internal Database URL」の内容をペースト)
- 「Deploy Web Service」のボタンをクリック後、デプロイ作業が開始される（デプロイ完了後、緑色のアイコンで「Live」と表示され、ターミナルに「Puma starting in cluster mode...」という文字が見える）

### 4.アプリ確認 
リンクをクリックして、ローカルで作った通りアプリが表示されたら成功。


## 参考
<a>https://qiita.com/likapantrip/items/933f246c2faf3867b211</a>    
<a>https://qiita.com/yuji1123200113/items/b25905f1bea39c1c8b42</a>  
<a>https://qiita.com/yuuki-h/items/9f594c046a6e676eb8f8</a>  
<a>https://qiita.com/Naaa0/items/8e2ad76e40e3a638ddfc</a>  
<a>https://render.com/docs/deploy-rails-8</a>  
