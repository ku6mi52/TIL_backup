def order(item)
  "#{item}をください"
end

puts order("キャラメルラテ")
puts order("アイスコーヒー")

# いつも頼むメニューをデフォルト値に設定する
def order(item = "ほうじ茶クラシックティーラテ")  # デフォルト値を設定
  "#{item}をください"
end

puts order  # 引数を省略して呼び出すと、デフォルト値である「ほうじ茶クラシックティーラテ」が呼び出される。 
puts order("カフェラテ")
puts order("モカ")

# キーワード引数
def order(item:, size:)
  "#{item}を#{size}サイズでください"
end

puts order(item: "キャラメルマキアート", size: "ベンティ")
puts order(size: "グランデ", item: "ピーチソーダ")

# キーワード引数でのデフォルト値
def order(item:, size: "ショート")  # sizeのデフォルト値に"ショート"を設定
  "#{item}を#{size}サイズでください"
end

puts order(item: "カフェラテ")  # 省略するとデフォルト値が使われる
puts order(item: "カフェラテ", size: "ベンティ")
