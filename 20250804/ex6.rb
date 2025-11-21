# 6-1
# ハッシュmenuからキーcaffe_latteに対応する値を取得
menu = {coffee: 300, caffe_latte: 400}
puts menu[:caffe_latte]

# キー"モカ"に対応する値を取得
menu = {"モカ" => "チョコレートシロップとミルク入り", "カフェラテ" => "ミルク入り"}
puts menu[:"モカ"]

# 6-2
# キーが:tea、値が300の組を追加して表示
menu = {coffee: 300, caffe_latte: 400}
menu[:tea] = 300
p menu

# キーが:coffeeの組を削除して表示
menu = {coffee: 300, caffe_latte: 400}
menu.delete(:coffee)
p menu

# キー:teaに対応する値がなければ、"紅茶はありませんか？"を表示
menu = {coffee: 300, caffe_latte: 400}
menu.default = "紅茶はありませんか？"
puts menu[:tea]
=begin
menu[:tea]が存在しないとnilが返るため、nilのときに実行するunlessを使うこともできる。
nilかどうか判断するにはif menu[:tea].nil?という書き方もできる。
ハッシュには、キーが存在するかどうかを調べるhas_key?メソッドもある。
=end
menu = {coffee: 300, caffe_latte: 400}
puts "紅茶はありませんか？" unless menu.has_key?(:tea)

# キーがあり、かつ、ハッシュのキー（:tea）から値を取得する方法。
menu = {coffee: 300, caffe_latte: 400}
puts "カフェラテください" if menu.has_key?(:caffe_latte) && 
  menu[:caffe_latte] <= 500

# 文字列"caffelatte"の中で使われているアルファベットと、その回数を調べる。
hash = {}
hash.default = 0
array = "caffelatte".chars  # 一文字ずつに区切った配列["c", "a",...]になる。
array.each do |x|  # eachメソッドで、一文字ずつ区切った配列を全要素繰り返す。
  hash[x] += 1  # ハッシュのキーとして値（回数）を取得し、1増やす。
end
p hash
=begin
[解説]
まず、空のハッシュを作り、ここに「文字→出現回数」というペアを入れる。
次に、存在しないキーを指定したときのデフォルト値を設定する。存在しないキーを呼んだときにnilを返すのではなく、0を返すという設定。これにより、hash[x] +=1と書いても初回は0 + 1から始まる。
3行目の配列で、"caffelatte"を一文字ずつに分解する。
4~6行目で、配列の全要素を一文字ずつxに入れて順番に処理する。
hash[x] += 1は、「その文字に対応する値を1増やす」ことを意味する。
=end

# Enumerable#tallyを使うともっと短く書ける
p "caffelatte".chars.tally

# 6-3
# menuの全組を「コーヒー-300円」の形で表示する
menu = {"コーヒー" => 300, "カフェラテ" => 400}
menu.each do |key, value|
  puts "#{key} - #{value}円"
end

# 上記の値が350以上のものだけを表示する
menu = {"コーヒー" => 300, "カフェラテ" => 400}
menu.each do |key, value|
  puts "#{key} - #{value}円" if value >= 350
end
  
# 上記のmenuに空ハッシュを代入した状態で実行
menu = {}
menu.each do |key, value|
  puts "#{key} - #{value}円"
end

# 上記のmenuから全キーを持つ配列を作る
menu = {"コーヒー" => 300, "カフェラテ" => 400}
keys = []
menu.each do |key, value|
  keys.push(key)
end
p keys

# ハッシュのkeysメソッド（すべてのキーを配列で取得するメソッド）を使うとより短く書ける
menu = {"コーヒー" => 300, "カフェラテ" => 400}
p menu.keys
