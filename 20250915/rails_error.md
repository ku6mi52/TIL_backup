# Railsのエラー文の種類
## NoMethodError
以下の状況で起こるエラー↓  
- 問題箇所のコントローラ#アクションが定義されていない  
- リクエストで指定されたコントローラにそのアクションがない

## Pending migration error
実行していないマイグレーションファイルがあると起こるエラー。

## Routing error
リクエストしたルーティングが設定されていないと起こるエラー。
config/routes.rbを確認し、view側ファイルのリクエスト箇所も確認する。
## syntax error
Rubyの文法エラー。

## Template is missing
指定されたviewファイルがない場合などに起こるエラー。

## 参考
<a>https://qiita.com/zuchi190/items/60dda046a52fbbd808e3</a>
