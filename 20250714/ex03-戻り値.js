const check = (number) => {
  return number % 7 === 0;
};

if (check(777)) {
  console.log("7の倍数です");
} else {
  console.log("7の倍数ではありません");
}

/*
出力結果↓

7の倍数です

*/
