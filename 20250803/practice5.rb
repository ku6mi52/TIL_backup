# 5-1
p ["コーヒー", "カフェラテ"].size
p [1, 2, 3, 4, 5].sum

# 5-2
p ["モカ", "カフェラテ", "モカ"].uniq
# clearメソッドをリファレンスマニュアルで調べて使ってみた
ary = [1, 2, 3]
ary.clear
p ary

p ["apple", "banana"].clear

# 5-3
p ["カフェラテ", "モカ", "カプチーノ"].sample
p ["大吉", "中吉", "末吉", "凶"].sample

# 5-4
p [100, 50, 300].sort
p [100, 50, 300].sort.reverse
p "cba".reverse

# 5-5
p ["100", "50", "300"].join(",")
p "100, 50, 300".split(",")

#5-6
result = [1, 2, 3].map do |x|
  x * 3
end
p result

result = ["abc", "xyz"].map do |y|
  y.reverse
end
p result

result = ["aya", "achi", "Tama"].map do |z|
  z.downcase
end 
result = result.sort
p result

# 上の処理を一行で書いた場合
p ["aya", "achi", "Tama"].map{|z| z.downcase}.sort

