# JavaScriptのまとめpart2

## 1.概要・学習目的
- progateのJS学習レッスン1（条件分岐）
- ログイン機能、売り切れ表示、クリック入力などのイベント制御の実装
- RubyやReact理解の土台

## 2.基本文法・ポイントまとめ  
### 条件分岐とは  
ある条件が成り立つときだけある処理を行うというプログラム。  
```
const number = 12  
if (number > 10) {  
    console.log("numberは10より大きいです");  
}  
▶「numberは10より大きいです」 
``` 
[出力結果](./ex01-条 件分岐.js)


### 真偽値とは
条件式が成り立つ場合出力されるtrue、成り立たない場合に出力されるfalseのこと。if文は、条件式がtrueなら処理が実行される。    
```
const age = 24;  
console.log(age >= 20);  
▶「true」  
console.log(age < 20);  
▶「false」
```  
[出力結果](./ex02-真偽値.js)


### 比較演算子の種類
- 大小比較する比較演算子(< ,<=, >, >=)
- 左右の値が等しいか調べる等価演算子(==, !=)
- 文字列と数値を異なるデータとして扱う厳密等価演算子(===, !==)
```
const password = "onakasuita";  
if (password === "onakasuita") {  
  console.log("ログイン成功");  
}  
if (password !== "onakasuita") {  
  console.log("パスワードが間違っています");  
}  
▶「ログイン成功」  
```
[出力結果](./ex03-比較演算子.js)

### 条件が成り立たないときの処理
「もしAならBを行う、そうでなければCを行う」という処理。if文は条件がtrueのときの処理で、else文は条件がfalseのときに処理実行される。  
```
const age = 15;  
if (age >= 18) {  
  console.log("ご覧になれます");  
} else {  
  console.log("18歳未満は観覧できません");  
} 
▶「18歳未満は観覧できません」
```
[出力結果](./ex04-条件が成り立たないときの処理.js)

さらに条件分岐を追加する場合↓  
```
const age = 17;  
if (age >= 18) {
  console.log("ご覧になれます");  
} else if (age >= 15) {
  console.log("R18+は観覧できませんが、R15+は観覧できます");  
} else {
  console.log("12歳未満の観覧には、親または保護者の助言・指導が必要です");  
}  
▶「R18+は観覧できませんが、R15+は観覧できます」 
```
[出力結果](./ex05-さらに条件分岐を追加.js) 


### 複数の条件式の組み合わせ
- x > 10 && x < 30 「xが10より大きいかつ30より小さい」  
 複数の条件がすべてtrueならtrueになる。
- x < 10 || x > 30 「xが10より小さいまたは30より大きい」  
 複数の条件のうち１つでもtrueならtrueになる。

### switch文とは
if文以外の条件分岐の方法。条件の数だけcaseを追加する。switchの条件の値がcaseのどの値にも一致しなかったときは、defaultのブロック（if文だとelse）が実行される。if,elseifよりもシンプルで読みやすいコード。    
※breakはswitch文の終了命令だから、１つのcaseにつき１つのbreakを必ず書く。  
```
const n = 2;  
switch (n) {  
  case 1:  
    console.log("大吉です");  
    break;  
  case 2:  
    console.log("吉です");  
    break;  
  case 3:  
    console.log("小吉です");  
    break;  
  default:  
    console.log("凶です");  
    break;  
}  
▶「吉です」
```
[出力結果](./ex06-switch文.js)


## 3.エラー・詰まった点
今回は省略

## 4.気づき・メモ
- 等価演算子は型を自動変換して比較する（文字列と数値という型の違いを無視）するから、バグの原因になりやすい。
- 等価演算子ではなく厳密等価演算子を使うのが安全。

## 5.次にやること
- JS(Ⅱ)のまとめを作成

