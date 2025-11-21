# Chart.jsまとめ

## Chart.jsとは 
無料のオープンソースJavaScriptライブラリ。様々なグラフを動きをつけてcanvasで描画できる。

## 書き方
### 1.Chart.jsのインストール
Importmapが入っていない場合は導入`bin/bundle add importmap-rails`,`bin/rails importmap:install`  
Chart.jsをピン`bin/importmap pin chart.js`  


### 2.グラフの情報を記述
グラフを挿入したいhtml.erbファイルに、canvasタグを配置。
#### グラフ描画エリア設定・Chart.js読み込み
```
<div>
  <canvas id="myChart"></canvas>
</div>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

```
1~3行目：グラフ描画エリアの指定にcanvas要素を使用。  
4行目：Chart.jsを使用するために、CDNに公開されているJSファイルを読み込む。  
設定したcanvas要素（ID:myChart）を取得し、変数ctxに代入する。

#### Chart設定
app/javascript/packs配下に[ファイル名].jsを作成。
```
var ctx = document.getElementById('myChart');
var myLineChart = new Chart(ctx, {
  type: タイプ,
  data: データ,
  options: オプション
}

```
1行目：設定したcanvas要素（ID:myChart）を取得し、変数ctxに代入する。  
2行目以降：描画するグラフをnew Chart()によって設定する。グラフを表示するためにはtype（描画するグラフの種類）, data（ラベルとデータセット）, options（オプション設定）の3項目を設定する必要がある。  
##### typeの種類
- bar・・・棒グラフ
- line・・・折れ線グラフ
- pie・・・円グラフ
- doughnut・・・円グラフ
- radar・・・レーダーチャート
- polarArea・・・鶏頭図
- bubble・・・バブルチャート
- scatter・・・散布図

##### data設定
- labels: データの軸ラベル
- datasets: データセット
datasetsでは、以下の４項目を設定する。  
- label: データの凡例
- data: データの値
- borderColor: 線の色
- backgroundColor: 線の下の塗りつぶしの色

##### option設定
- title: グラフのタイトル（display, textの設定）
- scales: グラフ軸の詳細（suggestedMax, suggestedMin, stepSize, callbackの設定）

### 3.サーバー起動して確認
`rails s`でサーバーを起動し、グラフが描画されているのを確認できたら成功。

## 参考
<a>https://www.chartjs.org/</a>  
<a>https://qiita.com/SAPPOROBEER/items/989bb97742b9851e7f71</a>  
<a>https://qiita.com/Haruka-Ogawa/items/59facd24f2a8bdb6d369</a>  
