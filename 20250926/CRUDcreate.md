# CRUDのCreate
newメソッドを実行すると、「永続化されていない」新規オブジェクトが返される（データベースには保存されない）が、createメソッドを実行すると新しいオブジェクトが返され、さらにデータベースに保存（永続化）される。    
ただし、newメソッドに.saveメソッド、.idメソッドを追記すると、新規オブジェクトがデータベースにコミットされ、idが割り当てられる。  

## バリデーション 
save, create, updateなどのメソッドは、モデルをデータベースに保存する前にバリデーションを行う。save, updateは、バリデーションに失敗するとfalseを返すが、createは引き続きオブジェクトを返すためエラーのチェックに利用できる。

## クエリ文字列
 URLの末尾に?パラメータ名=値の形式で追加されるパラメータ。クエリ文字列で指定されているパラメータも、すべてparamsに含まれる。
`get "tasks/:id", to: "tasks#show"`
ブラウザからのGETリクエストで/tasks/1?user_id=2というパスが渡されると、通常通りTasksControllerクラスのshowアクションに割り当てられる。このときのparamsは{ controller: 'tasks', action: 'show', id: '1', user_id: '2' }となる。

## ルーティング
HTTPメソッド、URL、コントローラアクションを対応付ける。  
|HTTP verb|パス|コントローラ＃アクション|目的|
|GET|/tasks/new|tasks#new|タスクを作成するためのHTMLフォームを返す|
|POST|/tasks|tasks#create|タスクを1つ作成する|

```
get "tasks/:id", to: "tasks/#show", as: "task"
```
```

task_pathとtask_urlというヘルパーメソッドを利用できる。
