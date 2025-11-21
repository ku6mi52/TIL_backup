# RailsのViewまとめ

## 前提
Ruby on Railsでアプリを作成していて、ビューについての理解が浅いと感じたので改めてまとめる。

## ビューとは 
MVCのVの部分で、ユーザーに画面表示をする役割を持つ。

## 手順
### 必要なERBファイル作成&編集
HTMLなどのテキストファイルないにRubyコードを埋め込み、動的にコンテンツを生成するためのテンプレートエンジン。RailsにおけるERBファイルは、[アクション名].html.erbになる。  
#### 1.app/views/[コントローラ名]/[アクション名].html.erbを作成し、編集する。  
#### 2.編集完了後、サーバーを起動してブラウザで設定したURLにアクセスしてビューを確認する。  

### レイアウトテンプレート編集 
app/views/layputs/application.htmlを編集する。  
#### 1.head要素 
stylesheet_link_tagメソッド（読み込むCSSファイルを指定できるヘルパーメソッド）で、application.cssを指定する。  
```
<!DOCTYPE html>
<html>
  <head>
    <!-- 省略 -->
  
    <!-- 読み込みたいCSSファイル（application.css）を「app/assets/stylesheets」に配下
        stylesheet_link_tagの引数に'application'を指定 -->
    <%= stylesheet_link_tag "application", "data-turbo-track": "reload" %>
  </head>

  <!-- 省略 -->
```

##### リセットCSS
link要素でリセットCSSを参照する。
#### 2.body要素
yieldメソッド（レイアウトテンプレートに各テンプレートを展開するためのメソッド）を使うと、全ページ共通の記述を各テンプレートファイルに記載する必要がない。  
```
<!DOCTYOE html>
<html>
  <head>
    <!-- 省略 -->
  </head>
  <body>
    <header>
      <!-- 省略 -->
    </header>
    <main>
      <!-- main要素のみ、各テンプレートに記述 -->
      <%= yield %>
    </main>
    <footer>
      <!-- 省略 -->
    </footer>
  </body>
</html>
```
このように、app/views/[コントローラ名]/[アクション名].html.erb（例：app/views/daily_records/index.html.erb, app/views/daily_records/new.html.erb）は、`app/views/layouts/application.html.erb`の<%= yield %>に集約される。

### CSS適用 
RailsにおいてCSSは`app/assets/stylesheets/application.css`で管理されており、require_tree機能でapplication.cssを介してCSSデータを取得している。この`app/assets/stylesheets/application.css`と`app/views/layouts/application.html.erb`を紐づけておく。`app/vires/layouts/application.html.erb`は、stylesheet_link_tagメソッドでapplication.cssを参照している。また、yieldメソッドでapplication.html.erbを介してデータを取得している。application.html.erbとapplication.cssを介してhtml.erbのクラスはcssのクラスに装飾される。  
#### `app/assets/stylesheets`にCSSファイルを作成し、編集する。

### 部分テンプレート
ビューファイルにおいて繰り返し使用するコードを切り出し、再利用する仕組みのこと。_[部分テンプレート名].html.erbになる。  
#### 1.`app/views/[コントローラ名]`or`app/views/shared`に、_[部分テンプレート名].html.erbを作成する  
#### 2._[部分テンプレート名].html.erbに、共通処理を記述する  
#### 3.[アクション名].html.erbに、renderメソッドで部分テンプレートの呼び出しを記述する


## 参考
<a>https://qiita.com/likapantrip/items/41e40c774daa310711de</a>  
<a>https://qiita.com/likapantrip/items/abbdeaabc88e330cb038</a>
