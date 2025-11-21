# 7-1
def order
  puts "カフェラテをください"
end

order

# 7-2
# 辺の長さが3の正方形の面積を計算して戻り値とするareaメソッド
def area
   3 * 3
end

puts area

# サイコロを振って出た目を戻り値とするdiceメソッド
def dice
  [1, 2, 3, 4, 5, 6].sample  # sampleメソッドは戻り値として配列の要素の中からランダムに1つを返す
end

puts dice

# 7-3
# カフェで注文するorderメソッドを定義して呼び出す（引数指定）
def order(item)
  "#{item}をください"
end

puts order("カフェラテ")
puts order("モカ")

# サイコロを振って1が出たら「もう1回」と表示し、更にサイコロをもう一度振り直すdiceメソッド
def dice
  result = [1, 2, 3, 4, 5, 6].sample
  return result unless result == 1
  puts "もう1回"
  [1, 2, 3, 4, 5, 6].sample
end

puts dice

#  品物の値段を返すpriceメソッド
def price(item:)
  items = {"コーヒー" => 300, "カフェラテ" => 400}
  items[item]
end

puts price(item: "コーヒー")
puts price(item: "カフェラテ")

# 上記のpriceメソッドにsizeによって値段を上乗せする仕組みを追加
def price(item:, size:)
  items = {"コーヒー" => 300, "カフェラテ" => 400}
  sizes = {"ショート" => 0, "トール" => 50, "ベンティ" => 100}
  items[item] + sizes[size]
end

puts price(item: "コーヒー", size: "トール")

# 上記のpriceメソッドを変更し、sizeが渡されないときのデフォルト値として"ショート"を設定する
def price(item:, size: "ショート")
  items = {"コーヒー" => 300, "カフェラテ" => 400}
  sizes = {"ショート" => 0, "トール" => 50, "ベンティ" => 100}
  items[item] + sizes[size]
end

puts price(item: "コーヒー")
puts price(item: "コーヒー", size: "トール")

# 7-5
def order(drink)
  puts "#{drink}をください"
end

drink = "コーヒー"
order(drink)


