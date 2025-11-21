# マイグレーションまとめ

## 1.概要・学習目的  
概要：マイグレーションについて理解を深める
目的：rails操作の基本として理解するため

## 2.基本文法・ポイント  
### マイグレーションとは 
マイグレーション（migration）はActiveRecordの機能の1つであり、データベーススキーマが長期にわたって進化を安定して繰り返せるようにするための仕組み。マイグレーション機能のおかげで、スキーマ変更を生SQLで記述せずに、Rubyで作成されたマイグレーション用のDSL（ドメイン固有言語）を用いてテーブルの変更を簡単に記述できる。
DBを完成させるためのステップ（テーブル作成、カラム追加など）を踏んでDBを完成させること。マイグレーション管理とは、DBの作成手順を小分けにして管理すること。Railsではマイグレーション管理をマイグレーションファイルで実現している。  
マイグレーション内でやり直す操作を「ロールバック」という。以下はロールバックの例である。  
- 「テーブルを作成する」のやり直しは、「テーブルを削除する」
- 「カラムを追加する」のやり直しは、「カラムを削除する」  
このように、ステップごとにロールバックできることは、マイグレーション管理のメリットである。  

### Railsでのマイグレーションファイルの書き方 
usersテーブルを作成するステップのマイグレーションファイルの書き方↓  
```
class CreateUsers < ActiveRecord: :Migration[5.0]
  def change
    create table :users do |t|
      t.string :name
      t.timestamps
    end
  end
end
```

ステップをchangeに記述し、`create table`でnameとtimestampsを持ったusersテーブルを作成する。  
create_tableメソッドは、デフォルトでidという名前の主キーを作成する。`:primary_key`オプションを使うと、以下のようにカラム名を変更可能。  
```
class CreateUsers < ActiveRecord: :Migration[8.0]
  def change
    create table :users, :primary_key: "user_id" do |t|
      t.string :username
      t.string :email
      t.timestamps
    end
  end
end
```


#### 単独のマイグレーション作成 
マイグレーションは、マイグレーションクラスごとに１個ずつdb/migrateディレクトリにファイル（YYYYMMDDHHMMSS_create_products.rb）として保存される。CamelCaseで記述するクラス名は、マイグレーションファイル名の後半部分と一致しなければならない。以下のコマンドを実行すると、アンダースコア形式のマイグレーション名の前にタイムスタンプが追加されたファイル名を持つ、空のマイグレーションファイルが作成される。  
`rails generate migration マイグレーション名`  

#### 新規テーブルを作成
以下のコマンドで、指定したカラムでテーブルをセットアップするマイグレーションファイルが生成される。  
`rails generate migration Createテーブル名 カラム名:型`  
db/migrate/YYYYMMDDHHMMSS_create_products.rbファイルを編集して、項目の追加や削除を行える。  

#### カラムの追加
以下のコマンドで、適切なadd_columnステートメントを含むマイグレーションファイルが生成される。カラムは復数追加可能。  
`rails generate migration Addカラム名Toテーブル名 カラム名:型`  

新しいカラムにインデックスも追加したい場合は以下。  
`rails genarate migration AddPartNumberToProducts part_number:string:index`  

#### カラムの削除  
以下のコマンドで、適切なremove_columnステートメントを含むマイグレーションファイルが作成される。  
`rails generate migration Removeカラム名Fromテーブル名 カラム名:型`  

#### コメントの追加
`:comment`オプションを使うと、テーブルを説明するコメントを書いてデータベース自身に保存することが可能。保存した説明文はMySQL WorkbenchやPgAdmin IIIなどのデータベース管理ツールで表示できる。  
```
class AddDetailsToProducts < ActiveRecord: :Migration[8.0]
  def change
    add_column :products, :price, :decimal, precision: 8, scale: 2, comment: "製品価格（ドル）"
    add_column :products, :stock_quantity, :integer, comment: "現在の製品在庫数"
  end
end
```


### マイグレーションの実行
マイグレーションを実行するには、`rails db:migrate`コマンドを実行する。

### ロールバックの実行 
ロールバックを実行するには、`rails db:rollback`コマンドを実行する。railsが自動でやり直しを判断してくれるから、手順を記述する必要がない。  

### Railsのマイグレーション管理方法
Railsはどこまでマイグレーションを実行したかを把握している。RailsがDBにschema_migrationsというテーブルを用意しており、マイグレーション実行履歴をそこで管理している。`ActiveRecord: :SchemaMigration.all`を実行すると、その中身が見れる。  
Railsのマイグレーションファイルには、バージョンという概念が存在する。バージョンはマイグレーションファイルのファイル名に日付として反映されている。  
schema_migrationsテーブルにバージョンがあれば、そのマイグレーションファイルは実行済みということである。rails db:migrateコマンドで、schema_migrationsテーブルにバージョンがないマイグレーションファイルを古い順に実行していき、今回実行したバージョンを追加でschema_migrationsテーブルに格納する。



## 4.気づき・メモ  
- Railsが実行済みを把握できるのはマイグレーションファイル単位なので、途中で失敗してやり直したい場合、実行済みのところはコメントアウトする。成功後にコメントアウトを必ず外す。

## 5.次にやること  
- railsガイドの「Active record」を読む

## 参考
<a>https://railsguides.jp/active_record_migrations.html</a>
<a>https://qiita.com/Arashi-K/items/4e26fd367847b8bbed18</a>
