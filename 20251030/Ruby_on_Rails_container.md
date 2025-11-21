# Ruby on Railsコンテナ

## 目的
Railsのコンテナを作成する。  
データベースはMariaDBを使用する。

## 手順
- Rubyをインストール  
- Railsの動作に必要なライブラリ（Node.jsやyarn）をインストール  
- Gemfile, Gemfile.lockファイルを作成  
- `bundle install`を実行して、railsをインストール  
- `rails new . --force --no-deps --database=mysql`を実行して、Railsのプロジェクトを作成  
- 作成したRailsプロジェクト内のdatabese.ymlをMariaDBに接続する設定に書き換える  
- `rake db:create`を実行して、データベースを作成する  
- `rails s`でWebサーバーを実行  

### 使用するイメージ  
- Ruby: https://hub.docker.com/_/ruby  
- mariadb: https://hub.docker.com/_/mariadb  

### 設定ファイル  
- compose.yaml  
- Dockerfile  
- Gemfile  
- Gemfile.lock  


## 結果

## 参考
書籍「Docker&仮想サーバー完全入門　Webクリエイター＆エンジニアの作業がはかどる開発環境構築ガイド」
