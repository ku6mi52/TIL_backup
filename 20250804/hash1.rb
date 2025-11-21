p( {:coffee => 300, :caffe_latte => 400})
p( {coffee: 300, caffe_latte: 400})

# 二個目の書き方は、ハッシュのキーにシンボルを指定したときのみ使える。
# ハッシュのキーに文字列などシンボル以外のオブジェクトを使う時は一個目のハッシュロケットを使う。


# 変数に代入してハッシュに名前をつける
menu = {:coffee => 300, :caffe_latte => 400}
p menu

# ハッシュから値を取得する
p menu[:coffee]

# ハッシュへキーと値の組を追加する
menu[:mocha] = 400
p menu

# ハッシュは同じキーを復数持てない
menu[:coffee] = 350
p menu
=begin 
このように、ハッシュに既にあるキーで値を追加しようとすると、後から追加したもので上書きされる。
キーに対する値を上書きして変更するときは、代入と同様の方法で行う。
=end 

# ハッシュから存在しないキーを指定したらnilが得られる
p menu[:tea]

# 存在しないキーを指定したときの値の設定
menu.default = 0
p menu[:tea]

# 2つのハッシュを1つにまとめる
coffee_menu = {coffee: 300, caffe_latte: 400}
tea_menu = {tea: 300, tea_latte: 400}
menu = coffee_menu.merge(tea_menu)
p menu

# ハッシュからキーと値の組を削除する
sushi_menu = {hamachi: 180, maguro: 150}
sushi_menu.delete(:maguro)
p sushi_menu

