# 配列のそれぞれの要素を2倍にした配列を作る
result = [1, 2, 3].map do |x|
  x * 2
end
p result

# 要素をほかの種類のオブジェクトへ変換する
# 変数yを使って数値を文字列に変換する。
result = [100, 200, 300].map do |y|
  "#{y}円"
end
p result

# 配列にmapメソッドを呼び出し、各要素の文字列をreverseメソッドで逆順にする
result = ["abc", "123"].map do |text|
  text.reverse
end 
p result

# mapメソッド省略形
result = ["abc", "123"].map{|text| text.reverse}
p result

# さらに省略形
result = ["abc", "123"].map(&:reverse)
p result

=begin 
（更に省略形の説明）
ブロックで呼び出したいメソッド（ここではreverse）の先頭に：をつけてシンボルにし、更に先頭に&をつけて渡す。
mapメソッドに限らず、ほかのブロックを渡すメソッドでも使える。
=end
