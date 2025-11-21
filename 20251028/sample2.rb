# if文の条件節で真偽値を判断するときは、== true, == falseと書くのではなく、以下の書き方をする。

s = ''
# empty?は、文字列が空文字だったときにtrueを返し、それ以外はfalseを返すメソッド
if s.empty?
  '空文字です'
end


n = 123
# zero?は、数値が0だったときにtrueを返し、それ以外はfalseを返すメソッド
if !n.zero?
  'ゼロではありません'
end
# 以下も同じ意味
unless n.zero?
  'ゼロではありません'
end


# Rubyはnilを偽として扱うので、== nilや!= nilと書かなくてよい。
user = nil
if !user
  'nilです'
end
# 以下も同じ意味
unless user
  'nilです'
end
# nil?メソッドは、オブジェクトがnilだった場合にtrueを返すメソッド
if user.nil?
  'nilです'
end
