# Dockerまとめ（WordPressコンテナ作成編）

## 学習目的
Dockerを理解して使いこなせるようになる。

## コンテナ内でコマンド実行
### docker compose execコマンド 
`docker compose exec コンテナ名 コンテナで実行したいコマンド`  
コンテナのバージョンを確認するときの例：docker compose exec db mariadb --version  

### コンテナ内でシェルを立ち上げる 
docker compose execコマンドは初期設定が必要なコマンドは実行できない場合もあるため、コンテナ内でシェルを起動させる。  
コンテナ内でbashを立ち上げ`docker compose exec コンテナ名 /bin/bash`

## 最小実験
### 目的
WordPress + MariaDBコンテナを構築する。

### 手順
使用するイメージ: wordpress, mariadb  
Docker HubのURL: https://hub.docker.com/_/wordpress, https://hub.docker.com/_/mariadb  

compose.yamlに以下を記載。  
```
services: 
  db:
    image: mariadb:10.7
    environment: 
      MARIADB_ROOT_PASSWORD: rootpass
      MARIADB_DATABASE: wordpress
      MARIADB_USER: wordpress
      MARIADB_PASSWORD: wordpress
    volumes: 
      - db-data:/var/lib/mysql
  wordpress: 
    image: wordpress:6.0
    depends_on: 
      - db 
    environment: 
      WORDPRESS_DB_HOST: db  # Docker Composeファイルで定義した接続先のコンテナ名
      WORDPRESS_DB_NAME: wordpress  # 接続先データベースのデータベース名
      WORDPRESS_DB_USER: wordpress # 接続先データベースのユーザー名
      WORDPRESS_DB_PASSWORD: wordpress # 接続先データベースのパスワード 
    ports: 
      - "8080:80"
    volumes:
      - wordpress-data:/var/www/html
volumes: 
  db-data:
  wordpress-data:
      
```



### 結果
ブラウザにアクセスすると、Wordpressのトップページが表示された。

## まとめ
- 再利用性のために、機能ごとにコンテナを分ける。  

## 次にやること
- バインドマウント 

## 参考
書籍「Docker&仮想サーバー完全入門」
