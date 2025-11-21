#4-1
p  ["コーヒー", "カフェラテ"]

#4-2
drinks = ["コーヒー", "カフェラテ", "モカ"]
puts drinks[1]
puts drinks.first
puts drinks.last

#4-3
p ["コーヒー", "カフェラテ"].push("モカ")
p [2, 3].unshift(1)
p [1, 2] + [3, 4]

#4-4
drinks = ["ティーラテ", "カフェラテ", "抹茶ラテ"]
drinks.each do |drink|
  puts "#{drink}お願いします"
end

#総和を求める処理
sum = 0
a = [1, 2, 3]
a.each do |x|
  sum = sum + x
end
puts sum

=begin 
ブロック内の変数sumの行で行われている処理
sum = 0 + 1
sum = 1 + 2
sum = 3 + 3
=end

#sumメソッド
puts a.sum

#0回の繰り返し処理
menus = []
menus.each do |menu|
  puts menu
end


