const products = [
  { name: "スマトラ", stock: 2 },
  { name: "エチオピア", stock: 5 },
  { name: "ケニア", stock: 0 },
];

//在庫ありの商品だけを戻り値で返す
const getAvailableProducts = (items) => {
  const result = [];
  for (const item of items) {
    if (item.stock > 0) {
      result.push(item);
    }
  }
  return result;
};

const available = getAvailableProducts(products);

available.forEach((item) => {
  console.log(`商品： ${item.name}`);
});

/*
出力結果↓

商品： スマトラ
商品： エチオピア
*/
