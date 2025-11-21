const characters = ["マイメロ", "クロミ", "ハンギョドン"];
console.log(characters);

console.log(characters[0]);

console.log(characters[2]);

characters[2] = "こぎゅみん";
console.log(characters[2]);

for (let i = 0; i < 3; i++) {
  console.log(characters[i]);
}

/*
出力結果↓

[ 'マイメロ', 'クロミ', 'ハンギョドン' ]
マイメロ
ハンギョドン
こぎゅみん
マイメロ
クロミ
こぎゅみん
*/
