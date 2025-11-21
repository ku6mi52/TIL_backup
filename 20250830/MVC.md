# MVC関係図

## MVCとは 
「Model」「View」「Controller」の略である。  
- モデル：アプリケーション内のデータ（DBテーブル）を管理する。
- ビュー：レスポンスをHTML, JSON, XMLなどのさまざまな形式でレンダリングする。
- コントローラ：ユーザー操作や各リクエストのロジックを処理する。

### MVCモデルの関係 
MVCモデルの関係図は、ユーザーからのリクエストがController, Model, Viewの順に処理され、画面表示がされるというという流れを示す。

### 3層アーキテクチャとの違い
3層アーキテクチャはWebシステム全体の設計方針であり、MVCモデルはサーバーサイド・スクリプトの設計方針だから対象とする範囲が異なる。    
  3層アーキテクチャは階層構造であり、最上層のプレゼンテーション層と最下層のデータ層が直接やり取りをすることはない。一方、MVCモデルでは、各要素が相互にやり取りを行う。また、WebアプリケーションにおいてはMVCモデルの表す範囲は3層アーキテクチャのアプリケーション層とデータ層であり、プレゼンテーション層はMVCモデルとユーザーの間の仲介を行う部分となる。

## Modelの具体例
ModelはDBとコントローラの仲介役として、データの登録、更新、削除、制約などの処理を行う。DBのテーブルに対応する行の型、バリデーション（入力チェック）、集計・計算などのドメイン知識を担う。  
具体例は以下の通りである。  
（条件）  
- 関連付け（belongs_to, has_many)
- ユニーク制約（「同じユーザーが同じ日に2件の記録を作れない」重複登録の禁止）
- 数値バリデーション（体重、体脂肪率は未入力okだが、それぞれ0 < weight < 200, 0 <= body_fat_percentage <= 100という範囲を設定）
- 日付ルール（未来日の禁止「recorded_on > 今日」をエラー扱いにする）
- デフォルト値の付与（before_validationで、recorded_onが空なら自動で今日を入れる）
- スコープ（scope :recent, -> { order(recorded_on: :desc) } により、一覧は常に新しい順に表示する）
- ドメインメソッド（weight_diff_from_yesterday で前日比(kg) を返す。前日記録がない場合は、nilを返す）  
```
# app/models/daily_record.rb
class DailyRecord < ApplicationRecord
  belongs_to :user

  validates :recorded_on, presence: true, uniqueness: { scope: :user_id }
  validates :weight, numericality: { greater_than: 0, less_than: 500 }, allow_nil: true
  validates :body_fat_percentage, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }, allow_nil: true

  validate :recorded_on_cannot_be_in_the_future

  scope :recent, -> { order(recorded_on: :desc) }

  before_validation :set_default_recorded_on

  def weight_diff_from_yesterday
    prev = self.class.find_by(user_id:, recorded_on: recorded_on - 1)
    return nil if prev&.weight.nil? || weight.nil?
    (weight - prev.weight).round(1)
  end

  private

  def set_default_recorded_on
    self.recorded_on ||= Time.zone.today
  end

  def recorded_on_cannot_be_in_the_future
    return if recorded_on.blank?
    errors.add(:recorded_on, 'は未来日を指定できません') if recorded_on > Time.zone.today
  end
end

```

## Viewの具体例 
ビューは、コントローラから受け取った@変数を表示、入力フォームとエラーメッセージの表示、表示のための最小限のロジック（ループ・条件分岐）という役割を担っている。  
具体例は以下の通りである。  
（条件）  
### index（一覧ページ）
- @daily_recordsを新しい順で行ごとに並べる
- 体重や体脂肪率がnilのときは、「-」表示 
- 右端に「詳細」リンクを置き、各行のレコードへ自然に遷移できるようにする
- 記録未登録の場合は、「まだ記録がありません」と表示して新規作成に誘導 
### new/edit（新規作成/編集フォーム）
- 入力エラー時はフォーム上部にエラー一覧を出し、各フィールドは入力済値を保持して再入力の負担を減らす。
### show（詳細ページ）
- その日の「日付・体重・体脂肪率」を表示 
- 前日の記録がある場合はモデルのドメインメソッドの結果を併記。前日記録がなければ「-」表示
- 「編集」「削除」「一覧へ」の導線を用意
```
<!-- app/views/daily_records/index.html.erb -->
<h1>日次記録一覧</h1>
<%= link_to '新規作成', new_daily_record_path %>

<table>
  <thead>
    <tr><th>日付</th><th>体重</th><th>体脂肪率</th><th>前日比</th><th></th></tr>
  </thead>
  <tbody>
    <% @daily_records.each do |r| %>
      <tr>
        <td><%= r.recorded_on %></td>
        <td><%= r.weight || '—' %></td>
        <td><%= r.body_fat_percentage || '—' %></td>
        <td><%= r.weight_diff_from_yesterday || '—' %></td>
        <td><%= link_to '詳細', r %></td>
      </tr>
    <% end %>
  </tbody>
</table>

```

## Controllerの具体例  
Controllerの役割は、ユーザーから受け取った入力に応じて処理を行うことである。Viewからユーザーの操作が通知されると、ControllerがModelに命令を送り、Modelのデータを更新する。その結果を再びViewに反映させるという流れである（最終的な画面表示をControllerがViewに指示する）。  
具体例は以下の通りである。  
（条件）  
### index（一覧） 
- ログイン中のユーザーの記録だけを、recentスコープで新しい順に取得し、@daily_recordsに詰めてViewに渡す
### new（新規）
- @daily_record = current_user.daily_records.new インスタンスを用意し、Viewに空のフォームを描かせる
### create（作成）
- save成功：詳細へリダイレクトして、「作成しました」通知 
- save失敗：render :newでフォーム再表示（URLは変わらず、入力値とエラーが残る）
### edit/update（編集/更新）
- before_action :set_daily_recordで、自分の記録の中から該当idを取得
- update成功：詳細へリダイレクト 
- update失敗：render :editで再表示 
- 他人のidを指定したときに404とする「set_daily_recordをcurrent_user.daily_records.find(params[:id])」
### destroy（削除）
- 該当レコードを削除して一覧へリダイレクト 
```
# app/controllers/daily_records_controller.rb
class DailyRecordsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_daily_record, only: %i[show edit update destroy]

  def index
    @daily_records = current_user.daily_records.recent
  end

  def show; end

  def new
    @daily_record = current_user.daily_records.new
  end

  def create
    @daily_record = current_user.daily_records.new(daily_record_params)
    if @daily_record.save
      redirect_to @daily_record, notice: '記録を作成しました。'
    else
      flash.now[:alert] = '作成に失敗しました。'
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @daily_record.update(daily_record_params)
      redirect_to @daily_record, notice: '記録を更新しました。'
    else
      flash.now[:alert] = '更新に失敗しました。'
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @daily_record.destroy
    redirect_to daily_records_path, notice: '記録を削除しました。'
  end

  private

  def set_daily_record
    @daily_record = current_user.daily_records.find(params[:id])
  end

  def daily_record_params
    params.require(:daily_record).permit(:recorded_on, :weight, :body_fat_percentage)
  end
end

```

### Routing
ルーティングはURLを構成する要素の1つであり、受信したHTTPリクエストを適切なコントローラとアクションに転送してリクエストの処理方法を決定する。ルーティングが受け取ったリクエストを適切なコントローラのアクションに対応付け、コントローラアクションでリクエストを処理し、ビューに表示するデータを準備する。  
Railsにおけるルーティングは、HTTPメソッドとURLパスをペアにしたコード行を指す。


## まとめ 
### Modelの役割 
データとビジネスルール担当。  
- DBテーブルに対応する行の型・ふるまいを定義 
- 入力チェック（バリデーション）とドメインルールの中心
- よく使う絞り込みや並び替え（スコープ）を提供 

### Viewの役割 
見た目と入出力担当。  
- コントローラから受け取った@変数をそのままわかりやすく表示
- 入力フォームとエラーメッセージの表示 
- 表示のための最小限のロジック（ループ・条件分岐）に留める 

### Controllerの役割 
司令塔・交通整理担当。  
- URL/HTTPメソッドごとに何をしてどの画面を返すか考える 
- Modelを呼んで作成/取得/更新/削除を行い、Viewに@変数を渡す 
- 成功時はリダイレクト、失敗時は同じフォームを再表示（render）+フラッシュで通知

## 参考
<a>https://railsguides.jp/getting_started.html</a>
