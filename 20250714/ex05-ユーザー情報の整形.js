const formatUserInfo = (name, age,jobTitle) => {
  return `名前:${name}, 年齢:${age}, 職業:${jobTitle}`;
};

console.log(formatUserInfo("村上春樹", 76, "小説家・翻訳家"));

console.log(formatUserInfo("ヒカル", 34, "YouTuber"));

/*
出力結果↓

名前:村上春樹, 年齢:76, 職業:小説家・翻訳家
名前:ヒカル, 年齢:34, 職業:YouTuber

*/
