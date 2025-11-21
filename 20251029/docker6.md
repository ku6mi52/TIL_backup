# Dockerまとめ6（再ビルド、キャッシュ、ネットワーク）

## 学習目的
Dockerを自分で使えるようになる。

## イメージを再ビルドする方法  
Dockerfileのバージョン変更をした後に、イメージの再ビルドする必要がある。  
`docker compose build`でイメージの再ビルドができる。イメージの再ビルドとコンテナの実行を同時に行う場合は、`docker compose up -d --build`を使う。  
※`docker compose up -d`は、イメージが既にある場合にビルドし直すことなく、すでにあるイメージを使用するときに使う。  

## キャッシュとは  
以前行った操作や処理のデータ。
### Dcokerfileが更新されない場合
Dockerfileを更新し、`docker compose build`実行後もDockerfileの変更内容がイメージに反映されない場合がある。イメージのビルドにはキャッシュが使われるため、キャッシュを使わずにイメージをビルドするには、`docker compose build --no-cache`でできる。  

## Dockerのネットワーク 
Dockerのネットワークを一覧表示`docker network ls`  
Dockerが自動で作成したデフォルトネットワークは以下の3つがある。  
- bridge: コンテナ間、コンテナ外と通信できる。（主に使われる）  
- host: Dockerホストのネットワークをそのまま使う。  
- none: コンテナ間、コンテナ外とも通信できない。

Docker Conposeでは、Docker Composeで定義したコンテナが通信できる専用のネットワーク（コンテナ間、コンテナ外と通信可能）がデフォルトで作成される。

## まとめ
- イメージがない場合は`docker compose up -d`で、イメージの再ビルドをする際は`docker compose build`  
- `docker compose build --no-cache`は、処理速度に時間がかかるため、意図的に使うならok  

## 次にやること
- 具体的なDocker設定ファイルを作成する。（PostgreSQL, Ruby, Ruby on Rails等）

## 参考
書籍「Docker&仮想サーバー完全入門　Webクリエイター＆エンジニアの作業がはかどる開発環境構築ガイド」
