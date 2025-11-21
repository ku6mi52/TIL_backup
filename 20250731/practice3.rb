#3-1
a = 2
p a == 1 + 1

#3-2
season1 = "春"
unless season1 == "夏"
  puts "あんまん食べたい"
end

season2 = "夏"
if season2 == "夏"
  puts "かき氷食べたい"
  puts "麦茶飲みたい"
end

#3-3
wallet = 100
if wallet >= 120
  puts "ジュース買おう"
else
  puts "お金じゃ買えない幸せがたくさんあるんだ"
end

#3-4
x = 200
if x <= 0 || x >= 100
  puts "範囲外です"
end

a = 0
b = -1
c = 1
if a > 0 || b > 0 || c > 0
  puts "正の数です"
end

#3-5
season3 = "春"
case season3
when "春"
  puts "アイスを買っていこう!"
when "夏"
  puts "かき氷を買っていこう！"
else
  puts "あんまんを買っていこう!"
end

#3-6
2.times do
  puts "カフェラテ"
  2.times do
    puts "モカ"
  end
end
puts "フラペチーノ"
