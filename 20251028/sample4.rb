# ?で終わるRubyメソッドのことを述語メソッドという。
# このメソッドは、慣習として真偽値を返すメソッドになっている。

# 空文字列であればtrue, そうでなければfalse
p ''.empty?
p 'abc'.empty?
# 引数の文字列が含まれていればtrue, そうでなければfalse
p 'watch'.include?('at')
p 'watch'.include?('in')
 
# 奇数ならtrue, 偶数ならfalse
p 1.odd?
p 2.odd?

# 偶数ならtrue, 奇数ならfalse
p 1.even?
p 2.even?
 
# オブジェクトがnilならtrue, そうでなければfalse
p nil.nil?
p 'abc'.nil?
p 1.nil?
 
# 3の倍数ならtrue, それ以外はfalseで返すメソッドを自分で定義した場合
def multiple_of_three?(n)
  n % 3 == 0
end
p multiple_of_three?(4)
p multiple_of_three?(5)
p multiple_of_three?(6)
 


