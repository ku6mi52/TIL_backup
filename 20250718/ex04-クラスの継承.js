class Animal {
  constructor(name) {
    this.name = name;
  }
  speak() {
    return `名前は${this.name}です。`;
  }
}

class Dog extends Animal {
  speak() {
    return `名前は${this.name}です。ワンワン!`;
  }
}

class Cat extends Animal {
  speak() {
  return `名前は${this.name}です。ニャー!`;
  }
}

const dog = new Dog("ポチ");
const cat = new Cat("タマ");

console.log(dog.speak());
console.log(cat.speak());

/*
出力結果↓
名前はポチです。ワンワン!
名前はタマです。ニャー!
*/

