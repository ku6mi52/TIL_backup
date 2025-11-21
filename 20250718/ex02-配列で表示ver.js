class Menu {
  constructor(name, price) {
    this.name = name;
    this.price = price;
  }
}

const menus = [
  new Menu("ハンバーグ", 1500),
  new Menu("オムライス", 1200),
  new Menu("お茶漬け", 800)
];

menus.forEach(menu => {
  console.log(`メニュー名: ${menu.name}`);
  console.log(`値段: ${menu.price}`);
});

/*
出力結果↓
メニュー名: ハンバーグ
値段: 1500
メニュー名: オムライス
値段: 1200
メニュー名: お茶漬け
値段: 800

*/

