class Menu {
  constructor(name, price) {
    this.name = name;
    this.price = price;
  }
}

const menu1 = new Menu("ハンバーグ", 1500);
console.log(`メニュー名: ${menu1.name}`);
console.log(`値段: ${menu1.price}`);

const menu2 = new Menu("オムライス", 1200);
console.log(`メニュー名: ${menu2.name}`);
console.log(`値段: ${menu2.price}`);

const menu3 = new Menu("お茶漬け", 800);
console.log(`メニュー名: ${menu3.name}`);
console.log(`値段: ${menu3.price}`);

/*
出力結果↓
メニュー名: ハンバーグ
値段: 1500
メニュー名: オムライス
値段: 1200
メニュー名: お茶漬け
値段: 800

*/
