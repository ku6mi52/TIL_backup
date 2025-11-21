# アソシエーションとリレーションの違い

## アソシエーションとは 
2つのActive Recordモデル同士のつながり。つまり、クラス同士の関係のこと。Railsがモデル間でリレーションを扱いやすくするための仕組み（モデル間の関連付け宣言）。  
モデルに「関連付けるためのメソッド」を追加してくれる機能。これにより user.posts と書くと裏で SELECT * FROM posts WHERE user_id = ? が発行される。  

```
class User < ApplicationRecord
  has_many :task   # has_manyはアソシエーション 
end

class Task < ApplicationRecord 
  belongs_to :user   # belongs_toはアソシエーション 
end 
  
```
また、アソシエーションはER図の線で表す部分のことでもある。

### 関連付けの種類
- belongs_to
- has_one 
- has_many 
- has_many :through 
- has_one :through 
- has_and_belongs_to_many

#### belongs_to 
他方のモデルとの間に「1対1」のつながりが設定される。このとき、宣言を行ったモデルのすべてのインスタンスは、他方のモデルのインスタンスに「従属(belongs to)」する。belongs_to関連付けで指定するモデル名は必ず「単数形」にする。elongs_to関連付けを宣言したクラスでは、以下の6つのメソッドを自動的に利用できる。   
- association
- association=(associate)
- build_association(attributes = {})
- create_association(attributes = {})
- create_association!(attributes = {})
- reload_association

#### has one 
他方のモデルとの間に「1対1」の関連付けを設定するが、belongs_toと異なり、その宣言が行われているモデルのインスタンスが、他方のモデルのインスタンスを「まるごと含んでいる」または「所有している」ことを示す。  
2つのモデルの間に1対1の関係を作りたいのであれば、いずれか一方のモデルにbelongs_toを追加し、もう一方のモデルにhas_oneを追加する必要がある。belongs_toとhas_oneのどちらを選ぶかは、外部キー(foreign key)をどちらに置くかである。外部キーは、belongs_toを追加した方のモデルのテーブルに追加される。  
has_one関連付けを宣言したクラスも、belongs_to関連付けを宣言したクラスと同様の6つのメソッドを自動的に利用できるようになる。

#### has_many 
他のモデルとの間に「1対多」のつながりがあることを示す。has_many関連付けが使用されている場合、「反対側」のモデルでは多くの場合belongs_toが使われる。has_many関連付けが使用されている場合、そのモデルのインスタンスは、反対側のモデルの「0個以上の」インスタンスを所有する。has_many関連付けを宣言する場合、相手のモデル名は「複数形」にする。   
has_many関連付けを宣言したクラスでは、以下の17のメソッドを自動的に利用できる。  
- collection
- collection<<(object, ...)
- collection.delete(object, ...)
- collection.destroy(object, ...)
- collection=(objects)
- collection_singular_ids
- collection_singular_ids=(ids)
- collection.clear
- collection.empty?
- collection.size
- collection.find(...)
- collection.where(...)
- collection.exists?(...)
- collection.build(attributes = {}, ...)
- collection.create(attributes = {})
- collection.create!(attributes = {})
- collection.reload
#### has_many :through 
他方のモデルと「多対多」のつながりを設定する。この関連付けは、2つのモデルの間に「第3のモデル」(結合モデル)が介在する点が特徴で、相手モデルの「0個以上」のインスタンスとマッチする。  結合モデル(join model)のコレクションは、has_many経由で管理可能。
#### has_one :through 
他方のモデルに対して「1対1」のつながりを設定する。この関連付けは、2つのモデルの間に「第3のモデル」(結合モデル)が介在する点が特徴で、相手モデルの1つのインスタンスとマッチする。
#### has_and_belongs_to_many 
他方のモデルと「多対多」のつながりを作成するが、through:を指定した場合と異なり、第3のモデル(結合モデル)が介在しない(ただし、結合用のテーブルは必要)。  
has_and_belongs_to_manyは関連付けを直接指定する場合で、has_many :throughは結合モデルを使用した間接的な関連付けをする場合に使用する。リレーションシップのモデルそれ自体を独立したエンティティとして扱いたい(両モデルの関係そのものについて処理を行いたい。例えば、結合モデルで検証(validation)、コールバック、追加の属性が必要な場合など。)のであれば、中間に結合モデルを使用するhas_many :throughリレーションシップを選ぶ。リレーションシップのモデルで何か特別なことをする必要がまったくないのであれば、結合モデルの不要なhas_and_belongs_to_manyリレーションシップを使用する。ただし、結合モデルが不要な代わりに、専用の結合テーブルを別途データベースに作成しておく必要がある。has_and_belongs_to_many関連付けを宣言したクラスでも、has_many関連付けを宣言したクラスと同様の１７のメソッドを自動的に利用できるようになる。

## リレーションとは 
テーブル同士の関係のこと（一体多、多対多など）。Railsの ActiveRecord::Relation オブジェクト。  
つまり、リレーションはデータベース上で「テーブル間の関係性」そのものを指す。実際にデータを条件付きで取得・チェーンで絞り込む場合に使用する。(コントローラやサービス層で書く)

## まとめ 
開発者はアソシエーションを定義して、リレーションを操作している。リレーションはSQL、アソシエーションはRailsの仕組み。  
- モデルに書くとき → アソシエーション
- データ取得時に条件つけるとき → リレーション  
アソシエーションは入口で、リレーションは操作ともいえる。

## 参考
<a>https://qiita.com/kazukimatsumoto/items/14bdff681ec5ddac26d1</a>  
<a>https://railsguides.jp/v5.2/association_basics.html</a>  
<a></a>
