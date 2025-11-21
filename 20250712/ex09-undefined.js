const actresses = [
  {name: "石原さとみ", age: 38},
  {name: "新垣結衣", age: 37},
  {name: "吉岡里帆", age: 32},
  {name: "吉田羊"}
];

for (let i =0; i < actresses.length; i++) {
  const actress = actresses[i];
  console.log(`名前は${actress.name}です`);
  if (actress.age === undefined) {
    console.log("年齢は秘密です");
  } else {
    console.log(`${actress.age}歳です`);
  }
}

/*
出力結果↓

名前は石原さとみです
38歳です
名前は新垣結衣です
37歳です
名前は吉岡里帆です
32歳です
名前は吉田羊です
年齢は秘密です

*/
