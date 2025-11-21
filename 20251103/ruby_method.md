# Rubyメソッドメモ

## getsメソッド  
文字列をそのまま取得し、改行文字も含めて返す。
```
puts 'お名前を入力して下さい。'
name = gets
puts "こんにちは、#{name}さん！"
```
上記の出力結果は、  
```
お名前を入力して下さい 
花子
こんにちは、花子
さん！
```
となる。

## chompメソッド
文字列の末尾から改行を取り除く。
```
puts 'お名前を入力して下さい。'
name = gets.chomp
puts "こんにちは、#{name}さん！"
```
上記の出力結果は、  
```
お名前を入力して下さい 
花子
こんにちは、花子さん！
```
となり、getsメソッドだけの場合は改行が含まれるのに対して、gets.chompを使うと改行が取り除かれる。

## to_iメソッド
整数を返す。空文字、nil、数値に変換できない文字列などの場合は0を返す。 

## splitメソッド
文字列を分割して配列に変換できる。  
```
s = "Hello, World!"
array = s.split 
puts array
```
上記の出力結果は、
```
["Hello", "World!"]
```

## 参考
<a>https://qiita.com/Nagao-S/items/8c03b1996b2c27846937</a>
<a>https://qiita.com/SHinGo-Koba/items/1195d50306a30e8741a9</a>
<a>https://qiita.com/knowledge87sun/items/f736699491fdc5076f23#%E2%85%B5split%E3%83%A1%E3%82%BD%E3%83%83%E3%83%89</a>
<a>https://qiita.com/takashimayuusuke7316/items/46ec40de4d6a7ec0f175</a>
