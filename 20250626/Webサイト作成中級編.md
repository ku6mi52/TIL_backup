# Progate HTML&CSS学習レッスン中級編まとめ

## はじめに
Webページ制作を通してHTML&CSSについて学習した。HTMLの構成は以下の通りである。
- ヘッダー header
- トップ top-wrapper
- レッスン一覧 lesson-wrapper
- メッセージ message-wrapper
- フッター footer

## トップ top-wrapper
### 背景画像の指定
🔴background-image: url(画像のurl);
### 背景画像の大きさを指定
🔴background-size: cover;  
こうすることで、1枚の画像で表示範囲を埋め尽くすように画像の大きさが拡大縮小する。background-imageで指定された背景画像は表示範囲を埋め尽くすまで繰り返し表示される性質がある。
### 要素を中央に配置
width: ?px;  
margin: 0 auto;
### 要素を透過させる
🔴opacity: ?;  
透明度は0.0(完全に透明) ~ 1.0(完全に不透明)の数値で指定。
### 文字の間隔を指定
🔴letter-spacing: ?px;
### ボタンを作成
ボタンは<aタグで指定するが、<aタグはインライン要素であるため、width/height/上下のmarginが指定できない。  
そこで、インライン要素→インラインブロック要素に変換する。    

{inline}
- width,height 指定できない
- margin,paddingの「左右のみ」指定できる
- 横並び

{inline-block}
- width,height,margin,paddingすべて指定できる
- 横並び

{block}
- width,height,margin,paddingすべて指定できる
- 縦並び

変換OK↓
インライン要素⇒インラインブロック要素、ブロック要素
ブロック要素⇒インラインブロック要素
### カーソルを乗せたときのCSSを指定(色を変える)
🔴セレクタ:hover {  
  background-color: red;  
}
### 角丸に指定
🔴border-radius: ?px;  
数字が大きいほど角が丸くなる。
### テキストの配置を指定
text-alignプロパティを用いることで、テキスト、インライン要素、インラインブロック要素の配置を指定することができる。  
- 左寄せ text-align: left;
- 中央揃え text-align: center;
- 右寄せ text-align: right;   
  
要素を中央寄せする方法の使い分け  
- 広い範囲を囲むようなブロック要素の場合・・・margin: 0 auto;
- テキストやボタンのようなインライン要素/インラインブロック要素の場合・・・text-align: center;  
### アイコンの使用方法
https://fontawesome.com   
①Font AwesomeのCSSファイルを読み込む  
<head<link rel="stylesheet" href="~~.css>  </head  
②<spanタグにfaクラスとfa-アイコン名クラスを指定する
（Font Awesomeのサイトにアイコンごとのクラス名が載っている。）  
<body<span class="fa fa-?" </span </body

 ## ヘッダー header
  ### 背景色のみを透明に指定
  🔴.rgba-sample {  
    background-color: rgba(84, 190, 238, 0.5);  
  }  
  4つ目の値が透明にする度合いで、0 ~ 1の数値で指定（値が小さいほど透明になる）  
  opacityプロパティは要素全体を透過させるのに対して、rgbaを使うとその色だけを透明に指定することが可能。
### hover時にアニメーション付きで色を変える  
🔴transition: 変化の対象 1s;  
変化の対象にはcolorなどのプロパティを指定するが、allを指定すると全てのプロパティに適用出来る。    
transitionでアニメーションをつけ、hoverと組み合わせて使う。  
### 行間を指定
🔴line-height: ?px;  
値が大きいほど行間が大きくなる。  
要素の高さとline-heightプロパティを同じ値にすると、文字がちょうど中央に配置されるようになる。
### インライン要素→ブロック要素
🔴display: block;  
インライン要素であるaタグは中身のテキスト範囲しか大きさを持たないため、クリックできる範囲がテキスト範囲のみである。そこで、<aタグをブロック要素にして範囲を親要素一杯に広げることで、ボックス全体をクリックできるようにする。  
### スクロールしてもヘッダーを上部に固定
🔴position: fixed;  
top,left,right,bottomを使って指定。  
positionを指定すると要素が重なるため、z-index: ?;を使用して、要素の重なりの順序を指定する。整数値の大きいほど上に表示される。

## レッスン一覧 lesson-wrapper
### 文字の太さを指定
🔴font-weight: normal (or bold);  
normalだと細くなり、boldだと太くなる。  
### 相対的な大きさの指定
ボックスのwidthやheightをpxではなく%で指定すると、親要素に対してどのくらいの幅や高さを持つか指定することができる。  
### 要素同士を重ねて表示する方法
基準位置の違い
- position: absolute;  ・・・サイト全体の左上部分  
- position: relative;  ・・・その要素の左上部分（基準としたい親要素に使用）  
基準からの位置をtop,left,right,bottomなどを用いて指定。  

## メッセージ message-wrapper
### 影の付け方
🔴box-shadow: 水平方法px 垂直方向px #色;
### クリック時に変化をつける
🔴セレクタ:active {   
  position: relative;  
  top: ?px;  
  box-shadow: none;影を消せる  
}
