# Dockerまとめ(バインドマウント・Flaskコンテナ作成編)

## 学習目的
Dockerを使えるようになる。

## ボリュームとは
Dockerが管理する記憶領域にデータを永続化する仕組み。  
- データ変更：コンテナを通してデータ操作する(バインドマウントより、データの移行やバックアップが容易。公式でも推奨されている)。  
- 向いているデータ：直接変更することがないデータ（データベースのデータなど）  
コンテナを削除してもボリュームを残しておけば、再度コンテナを作成した際にそのボリュームをマウントすればデータを利用できる。  
- Docker Composeファイル  
```
services: 
  コンテナ名:
    images: 使用するイメージ名  
    volumes: 
      - 「volumes」に定義したボリューム名:コンテナ内のパス
volumes:
  ボリューム名
```

## バインドマウントとは
ホストOSやフォルダをファイルにマウントする仕組み。  
- データ変更：ホストOSのファイルを直接変更することで、コンテナ内にも自動で反映される。
- 向いているデータ：変更の頻度が高いデータ  
- Docker Composeファイル
```
services:
  コンテナ名:
    images: 使用するイメージ
    volumes:
      - ホストOSのフォルダー:コンテナ内のパス
```

## Webアプリフレームワークとは
Webアプリを作るための機能や仕組みをまとめたもの。Flaskは、PythonのWebフレームワーク。

## DockerFileとは
どんなイメージを作るのか設定を記述するテキストファイル。DockerFileに記述できる主な命令は以下の通り。  
- FROM: もととなるイメージを設定できる。  
- RUN: イメージのビルド時に実行するコマンド。  
- CMD: コンテナの起動時に、実行するデフォルトのコマンド。`docker container run`コマンドやDocker Composeファイルで上書きすることが可能。  
- EXPOSE: 公開するポート番号。ただし、あくまでどのポートを公開するかという意図を表すものであり、実際に公開するには、`docker container run`で「-p」を指定するか、Docker Composeファイルで「ports」を記述する必要がある。  
- COPY: イメージにファイルやフォルダをコピーする。  
- ADD: イメージにファイルやフォルダをコピーする。tarファイルの展開などコピーより多機能。基本的にCOPYの方が推奨されている。  
- ENTRYPOINT: コンテナの起動時に実行するコマンド。基本的にはコマンドの上書きはできない。  
- WORKDIR: 作業ディレクトリを指定する。該当ディレクトリが存在しない場合、ディレクトリを作成。

## 最小実験
### 目的 
- WebアプリフレームワークのコンテナであるFlaskコンテナを作成する。
- Webブラウザ上に「Hello Flask!」と表示する。  

### 手順
#### Flaskを使う手順
- Pythonをインストール  
- `pip install flask`コマンドを実行して、Flaskをインストール  
- Flaskで動作させるプログラムを完成  
- `flask run`コマンドを実行して、Flaskに組み込まれているWebサーバーを実行  

上記のようなソフトウェアのインストールやファイルのコピーを行ったイメージを作りたい場合は、DockerFileを使う。

#### Flaskで動かすプログラムを作成  
app.py  
```
from flask import Flask  

app = Flask(__name__)

@app.route('/')
def hello_flask():
  return 'Hello Flask!'
```

#### Dockerfileを作成  
使用するイメージ名：python  
DockerHubのURL：https://hub.docker.com/_/python  

Flaskを動作させるイメージを作るために必要な手順は以下。  
- `pip install flask`を実行し、Flaskをインストール  
- 「app.py」をコンテナ内へコピーする  
- `flask run --host=0.0.0.0`を実行し、Flaskに組み込まれているWebサーバーを実行  

この手順を落とし込んだDockerfileは以下。  
```
FROM python:3.10  # イメージの指定 
WORKDIR /usr/src/app  # 作業ディレクトリの指定  
RUN pip install flask==2.1.0  # イメージのビルド時にコマンドを実行  
CMD ["flask", "run", "--host=0.0.0.0"]  # コンテナの起動時にコマンドを実行  
```

compose.yaml（Pythonコンテナの定義を書く)  
```
services:
  web:
    build: .
    environment:
      FLASK_ENV: development
    ports:
      - "5000:5000"
    volumes:
      - ./src:/usr/src/app 
```

#### `docker compose up -d`を実行し、Webブラウザ(http://localhost:5000/)へアクセス  



### 結果
- ポート5000の競合
- Flask と Werkzeug のバージョン不整合が原因でエラーが発生した。  
Flask の古い系（～2.0.x）が werkzeug.urls.url_quote に依存しているが、Werkzeug 2.1+ でその関数が削除され、ImportError が出た。  
#### 対応 
以下のファイル内容を変更。
Dockerfile  
```
FROM python:3.10
WORKDIR /usr/src/app
RUN pip install "flask==2.3.3" "werkzeug>=3"  # バージョンの整合性 
CMD ["flask", "run", "--host=0.0.0.0"]
ENV FLASK_APP=app.py
```

compose.yaml  
```
services:
  web:
    build: .
    environment:
      FLASK_ENV: development
    ports:
      - "5001:5000"  # 5000だと競合したため
    volumes:
      - ./src:/usr/src/app

```
ブラウザにHello, Flask!が表示された。

## まとめ
### DockerfileとDocker Composeの違い 
#### Dockerfile 
- あくまでカスタムイメージ（ソフトウェアのインストール、特定のファイルのコピー）を作るためのファイル  
- ネットワークの作成はできない

#### Docker Compose 
- 複数コンテナの作成を行うソフトウェア 
- ネットワークの作成可能    
- どのコンテナを先に起動するかなどのコンテナの起動方法も制御できる

- `docker compose logs`は、コンテナのログを表示するコマンド

## 次にやること


## 参考
書籍「Docker&仮想サーバー完全入門　Webクリエイター＆エンジニアの作業がはかどる開発環境構築ガイド」
