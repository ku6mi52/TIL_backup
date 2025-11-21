# Dockerまとめ(compose編)

## 学習目的
dockerを理解して使いこなせるようになる。

## Docker Composeとは  
一度に複数のコンテナを作成・実行できるソフトウェア。dockerコマンドではなく、docker composeコマンドを使用する。  
Docker Composeでコンテナを作成するには、どういうコンテナを作成するか定義する「YAML（ヤムル）形式のファイル」が必要。YAMLとは、構造化データを記述できる記法のこと。Docker Composeでは、YAMLファイル（compose.yaml/compose.yml）にオプションをまとめて記述するため、Dockerとは異なりコマンド実行の際に何度も長いオプションを書かなくてよい。

### Docker Composeの3ステップ 
1. 作成したいコンテナの情報を整理  
  - どのソフトウェアがインストールされている環境が欲しいか  
  - どのバージョンを使うのか  
2. Docker Composeファイルを作成（必要に応じてDockerfileも作成）    
3. `docker compose up -d`コマンドでコンテナを作成・実行  

### Docker Composeファイルの主な項目  
Docker Composeファイルには、「services」以外にも、コンテナで使うネットワークを指定する「networks」や、データの保存に関して設定する「volumes」などがある。  
「services」の主な項目は以下の通り。  
- build  
- command  
- container_name  
- depends_on  
- entrypoint  
- env_file  
- environment  
- image  
- labels  
- networks  
- ports  
- restart  
- volumes  
- tty  
- working_dir

## 最小実験
### 目的
Docker ComposeでApacheコンテナを作成・停止・削除する。

### 手順
1. Apacheコンテナの情報を整理  
使用イメージ：httpd（バージョン2.4）  
ポート番号：8080:80  
2. Docker Composeファイル（compose.yaml）を作成し、以下を記述    
```
services:
  web:
    image: httpd:2.4
    ports:
      - "8080:80"
```
3. compose.yamlを配置した階層で、`docker compose up -d`を実行  
4. コンテナが作成されたか確認`docker container ls`（実行中のコンテナを一覧表示）。停止中のコンテナも含めた全てのコンテナを一覧表示させたい場合は、`docker container ls -a`。コンテナ一覧ではなく、Docker Composeのプロジェクトを一覧表示させたい場合は`docker compose ls`  
5. コンテナを停止`docker compsoe stop`  
6. 作成済のコンテナを再度起動`docker compose start`  

### 結果
```
apache % `docker compose up -d`
[+] Running 1/1
 ✔ web Pulled                                                                                                                                                                                              3.0s
[+] Running 2/2
 ✔ Network apache_default  Created                                                                                                                                                                         0.0s
 ✔ Container apache-web-1  Started                                                                                                                                                                         0.1s
apache % `docker container ls`
CONTAINER ID   IMAGE       COMMAND              CREATED          STATUS          PORTS                  NAMES
da3bede3bc4b   httpd:2.4   "httpd-foreground"   41 seconds ago   Up 40 seconds   0.0.0.0:8080->80/tcp   apache-web-1
 apache % `docker container ls -a`
CONTAINER ID   IMAGE               COMMAND                   CREATED              STATUS                           PORTS                  NAMES
da3bede3bc4b   httpd:2.4           "httpd-foreground"        About a minute ago   Up About a minute                0.0.0.0:8080->80/tcp   apache-web-1
apache % docker compose ls
NAME                STATUS              CONFIG FILES
apache              running(1)          /Users/k/docker-practice/chap4/apache/compose.yaml
apache % docker compose stop
[+] Stopping 1/1
 ✔ Container apache-web-1  Stopped                                                                                                                                                                         1.2s
apache % docker compose start
[+] Running 1/1
 ✔ Container apache-web-1  Started
```

## まとめ
- Docker Composeでは、コンテナ作成の設定をファイルにまとめる  
- `-d`は、コンテナをバックグラウンドで実行させるオプション  
- `-a`は、停止しているコンテナも含めて表示させるオプション  
- `docker compose up`は作成・実行を行うが、`docker compose start`は実行のみ  


## 次にやること
コンテナ構築練習をする。

## 参考
書籍「Docker&仮想サーバー完全入門　Webクリエイター＆エンジニアの作業がはかどる開発環境構築ガイド」
