# Dockerまとめ3（MariaDB構築編）

## 学習目的
Dockerを理解して使いこなす。

## MariaDBとは
MySQLデータベースから派生して作られたオープンソースのデータベース。  
イメージ名：mariadb  
Docker HubのURL：https://hub.docker.com/_/mariadb  

### 環境変数 
ユーザー名やパスワードのようなパラメータをコンテナに設定したり、コンテナ間で値を受け渡したりするのに環境変数が使われる。MariaDBイメージの主な環境変数は以下の通り。  
- MARIADB_ROOT_PASSWORD（ルートユーザーのパスワード）  
- MARIADB_DATABASE（データベース名）  
- MARIADB_USER（データベースのユーザー名）  
- MARIADB_PASSWORD（データベースのパスワード）  

コンテナに環境変数を設定するには、Docker Composeファイルの「services」で「environment」という項目を記述する。

### コピー
コピーは、コンテナが実行中でも停止中でも可能。  
- コンテナ内へファイルをコピー`docker compose cp ホストのファイルパス コンテナ名:コンテナ内のファイルパス`  
- Dockerホストへファイルをコピー`docker compose cp コンテナ名:コンテナ内のファイルパス コンテナ内のファイルパス`

例：docker compose cp web:/usr/local/apache2/htdocs/index.html .  
docker compose cp index.html web:/usr/local/apache2/htdocs/index.html  

### 削除
コンテナとネットワークを一度に削除`docker compose down`。（`docker compose rm`もコンテナ削除コマンドだが紐づくネットワークの削除はしないため、1つずつ確認しながら削除したい場合に適している。）  
`docker compose down`のオプションは以下の通り。  
- --rmi （イメージを削除）  
- -v（ボリュームを削除）  
- --remove-orphans（Docker Composeで定義されていないコンテナも削除）

## 最小実験
### 目的
MariaDBコンテナを構築する。

### 手順
- compose.yamlに、以下を記述。  
```
services:
  db:
    image: mariadb:10.7
    environment:
      MARIADB_ROOT_PASSWORD: rootpass
      MARIADB_DATABASE: testdb
      MARIADB_USER: testuser
      MARIADB_PASSWORD: testpass
    volumes:
      - db-data:/var/lib/mysql
volumes:
  db-data:
```

- compose.yamlを配置した階層で`docker compose up`
### 結果
Container [コンテナ名] Startedというログが表示された。

## まとめ
- 環境変数とは、コンテナ間でのパラメータ（値）の受け渡しのために設定されるもの。
- コピーはcp
- 削除はdown/rm

## 次にやること
コンテナ内でのコマンド実行、データ保存、ネットワークについて学ぶ。

## 参考
書籍「Docker&仮想サーバー完全入門」
