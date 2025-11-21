# ヘルパーとは
Railsでは、Active Viewで利用できるヘルパーメソッドが多数ある（以下が例）。  
- 日付・文字列・数値のフォーマット 
- 画像・動画・スタイルシートなどへのHTMLリンク作成
- コンテンツのサニタイズ
- フォームの作成
- コンテンツのローカライズ 

## フォーマット用ヘルパー 
日付・時刻ヘルパー、数値ヘルパー、テキストヘルパーなどがある。今回は省略。  

## フォームヘルパー  
モデルに基づいたフォーム生成に特化しており、ユーザー入力の種類（テキストフィールド、パスワードフィールド、ドロップダウンボックスなど）に応じたさまざまなメソッドを提供する。フォームが送信されると、フォームへの入力がparamsオブジェクトにまとめられてコントローラに送信される。
### 基本的なフォームの作成
`form_with`を引数なしで呼び出すと、<form>タグが生成される。コード例は以下。  
```
<%= form_with do |form| %>
  form contents
<% end %>
```

### 検索フォーム
`form_with`で検索フォームを作成する方法は以下。
```
<%= form_with url: "/search", method: get do |form| %>
  <%= form.label :query, "Search for:" %>
  <%= form.search._field :query %>
  <%= form.submit "検索" %>
<% end %>
```

上記のコードでは、「GETメソッドを送信するためのフォーム要素」「入力項目を示すラベル」「テキスト入力要素」「送信ボタン要素」が含まれる。

### モデルオブジェクトを指定したフォームの作成
form_withヘルパーの:modelオプションを使うと、モデルオブジェクトの値がフォームのフィールドに自動入力されるようになる。

## ナビゲーション
### button_to
渡されたURLに送信するフォームを生成する。`<%= button_to "ログインする", sign_in_path %>`  
### current_page?
ヘルパーに渡したオプションが現在のリクエストURLと一致する場合はtrueを返す。  
```
<% if current_page?(controller: 'profiles', action: 'show') %>
  <strong>Currently on the profile page</strong>
<% end %>
```

### link_to
内部でurl_forから導出したURLへのリンクを生成する。モデルを引数としてlink_toに渡すときによく使われる。  
```
link_to "Profile", @profile
link_to "Book", books_path

```
### mail_to
指定したメールアドレスへのリンクタグを生成する。

### url_for
optionsで渡した一連のオプションに対応するURLを返す。`url_for @profile`など。

## 参考
<a>https://railsguides.jp/action_view_helpers.html#url-for</a>  
<a>https://railsguides.jp/form_helpers.html</a>
