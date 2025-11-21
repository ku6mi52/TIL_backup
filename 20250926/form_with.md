# form_withの使い方

## form_withとは 
基本的なフォームヘルパー。form_withを引数なしで呼び出すと、<form>タグが生成される。method属性の値がpostに送信され、action属性の値が現在のページに設定される。  
フォームに<%= form.text_field :query %>が含まれている場合、コントローラでparams[:query]と書くことでこのフィールドの値を取得できる。  
## チェックボックス
ユーザーが選択肢の項目をオン/オフできるようにする。 必要な項目は以下の通りである。
- GETメソッドを送信するためのフォームメソッド
- 入力項目を示すラベル
- チェックボックス要素
- 送信ボタン要素
```
<%= form_with url: "/tasks", method: :post do |form| %>
  <%= form.check_box :task1 %>
  <%= form.label :task1, "Task1" %>
  <%= form.check_box :task2 %>
  <%= form.label :task2, "Task2" %>
  <%= form.check_box :task3 %>
  <%= form.label :task3, "Task3" %>
  <%= form.submit "送信する" %>
<% end %>
```

上のコードで以下が生成される。  
```
<form action="tasks_path" accept-charset="UTF-8" method="post">
  <input name="task1" type="hidden" value="0" autocomplete="off"><input type="checkbox" value="1" name="task1" id="task1">
  <label for="task1">Task1</label>
  <input name="task2" type="hidden" value="0" autocomplete="off"><input type="checkbox" value="1" name="task2" id="task2">
  <label for="task2">Task2</label>
  <input name="task3" type="hidden" value="0" autocomplete="off"><input type="checkbox" value="1" name="task3" id="task3">
  <label for="task3">Task3</label>
  <input type="submit" name="commit" value="Checked" data-disable-with="送信する">
</form>
```

params[:task1]で、ユーザーがそのチェックボックスを選択できているかどうかを確認できる。

## 参考
<a>https://railsguides.jp/form_helpers.html</a>


