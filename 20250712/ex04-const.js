const count = 3;
console.log(count);

count = 2;
console.log(count);
//コメントアウト

const user = { name: "山田"};
user.name = "川村";
console.log(user.name);

user = { name: "澤田" };
console.log(user.name);

/*
出力結果は以下
3

const user = { name: "山田"};
undefined
> user.name = "川村";
'川村'
> console.log(user.name);
川村
undefined
>
> user = { name: "澤田" };
Uncaught TypeError: Assignment to constant variable.
> console.log(user.name);
川村
*/
