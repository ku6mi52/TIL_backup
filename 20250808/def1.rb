# 辺の長さが2である正方形の面積を計算するメソッド
def area  # メソッド定義
  puts 2 * 2
end

area  # メソッド呼び出し


# メソッドの戻り値
def area
  2 * 2
end

puts area  
=begin 
areaが戻り値である4で置き換わって、puts 4となる。
メソッド内でputsするのではなく、計算結果の整数オブジェクトを戻り値として返すよう変更。
=end

# 戻り値を変数に代入する
result = area
puts result


# 辺の長さxの正方形の面積を計算するメソッド
def area(x)
  x * x
end

puts area(2)

puts area(3)


# 2つ以上の引数を持つメソッドを定義する
def area(x, y)
  x * y
end

puts area(2, 3)

# メソッドを途中で終わらせるreturn
def thanks_and_receipt
  puts "ありがとうございました"
  return
  puts "レシートのお渡しです"
end

thanks_and_receipt

# returnを引数によって切り替える
def thanks_and_receipt(receipt)
  puts "ありがとうございました"
  unless receipt  # receiptがfalseのときに次の行を実行
    return
  end
  puts "レシートのお渡しです"
end

thanks_and_receipt(false)
thanks_and_receipt(true)

# returnに戻り値を設定する
def thanks_and_receipt(receipt)
  greeting = "ありがとうございました"
  unless receipt  # receiptがfalseのときに次の行を実行
    return greeting # 戻り値
  end
  greeting + "レシートのお渡しです"  # receiptがtrueのときに実行される戻り値
end

puts thanks_and_receipt(true)
puts thanks_and_receipt(false)


  
