drinks = ["コーヒー", "ラテ", "モカ"]
drinks.each do |drink|
  puts drink
end

#繰り返しを途中で終わらせる
[1, 2, 3].each do |x|  #配列の各要素を順番にxに代入
  break if x == 2   #xの値が2のときに繰り返しを終わらせる
  puts x  #変数xの値を表示
end

#繰り返しの次の回へ進む
[4, 5, 6].each do |y|
  next if y == 5
  puts y
end

#Rangeオブジェクトにeachメソッドを呼び出して、指定範囲の繰り返し処理
(3..5).each do |z|
  puts z
end
