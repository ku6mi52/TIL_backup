# APIまとめ 
## APIとは
ソフトウェアやプログラム、アプリケーションがデータや機能をやり取りするためのインターフェース。スマホアプリのデータ送信・受信の処理によく使われる。  
（例）天気予報アプリで、アプリが送信した地域上表をプログラム用APIの役割を持つWebサーバーが受け取り、Webサーバーは受け取った地域情報に対応する天気予報のデータをアプリに返す。

## カールコマンド
様々なプロトコル（通信手順）を用いてURLで示されるネットワーク上の場所との間でデータの送受信を行うもの。サーバーでよく使うオプションは以下の通り（ただのGETリクエストを投げたいだけならオプション不要）。  
-X <request method(POST/GET)>: メソッドの指定。これを指定しない場合はデフォルトでGETになるので、GETのときは指定しなくてOK。
-H <header>: ヘッダを追加する。
-s: 実行中のメッセージを表示しない。(コマンドの実行結果の詳細が不要の時につける)
-v: -sとは逆に詳細を出力する。
-o: ファイルに保存。(-o index.htmlなど)
-w: statusの結果を表示する。-w "%{time_starttransfer}"で、かかった時間を表示できる。
-d "id=01234": パラメーターを付与したい時に使用する。複数のパラメーターを指定したい場合は、複数使用することが可能。もしくは-d "id=01234"&password=abcd

## APIライブラリたたいてみた（WikipediaAPI）
実行コマンド（RESTAPIの要約型）  
`curl -s "https://ja.wikipedia.org/api/rest_v1/page/summary/今泉力哉"`   
結果  
```
{"type":"standard","title":"今泉力哉","displaytitle":"<span class=\"mw-page-title-main\">今泉力哉</span>","namespace":{"id":0,"text":""},"wikibase_item":"Q16769769","titles":{"canonical":"今泉力哉","normalized":"今泉力哉","display":"<span class=\"mw-page-title-main\">今泉力哉</span>"},"pageid":2968576,"thumbnail":{"source":"https://upload.wikimedia.org/wikipedia/commons/thumb/7/7b/Imaizumi_Rikiya_from_%22by_the_window%22_at_Red_Carpet_of_the_Tokyo_International_Film_Festival_2022_%2852461542085%29.jpg/330px-Imaizumi_Rikiya_from_%22by_the_window%22_at_Red_Carpet_of_the_Tokyo_International_Film_Festival_2022_%2852461542085%29.jpg","width":320,"height":480},"originalimage":{"source":"https://upload.wikimedia.org/wikipedia/commons/7/7b/Imaizumi_Rikiya_from_%22by_the_window%22_at_Red_Carpet_of_the_Tokyo_International_Film_Festival_2022_%2852461542085%29.jpg","width":5464,"height":8192},"lang":"ja","dir":"ltr","revision":"106477110","tid":"c8df3012-9225-11f0-aa24-a0e8d35e97fd","timestamp":"2025-09-15T11:19:03Z","description":"日本の映画監督 (1981-)","description_source":"central","content_urls":{"desktop":{"page":"https://ja.wikipedia.org/wiki/%E4%BB%8A%E6%B3%89%E5%8A%9B%E5%93%89","revisions":"https://ja.wikipedia.org/wiki/%E4%BB%8A%E6%B3%89%E5%8A%9B%E5%93%89?action=history","edit":"https://ja.wikipedia.org/wiki/%E4%BB%8A%E6%B3%89%E5%8A%9B%E5%93%89?action=edit","talk":"https://ja.wikipedia.org/wiki/%E3%83%8E%E3%83%BC%E3%83%88:%E4%BB%8A%E6%B3%89%E5%8A%9B%E5%93%89"},"mobile":{"page":"https://ja.m.wikipedia.org/wiki/%E4%BB%8A%E6%B3%89%E5%8A%9B%E5%93%89","revisions":"https://ja.m.wikipedia.org/wiki/Special:History/%E4%BB%8A%E6%B3%89%E5%8A%9B%E5%93%89","edit":"https://ja.m.wikipedia.org/wiki/%E4%BB%8A%E6%B3%89%E5%8A%9B%E5%93%89?action=edit","talk":"https://ja.m.wikipedia.org/wiki/%E3%83%8E%E3%83%BC%E3%83%88:%E4%BB%8A%E6%B3%89%E5%8A%9B%E5%93%89"}},"extract":"今泉 力哉 は、日本の映画監督。福島県郡山市出身。キリスト教徒。","extract_html":"<p><b>今泉 力哉</b> は、日本の映画監督。福島県郡山市出身。キリスト教徒。</p>"}%
```

jqで読みやすくした版  
```
{
  "type": "standard",
  "title": "今泉力哉",
  "displaytitle": "<span class=\"mw-page-title-main\">今泉力哉</span>",
  "namespace": {
    "id": 0,
    "text": ""
  },
  "wikibase_item": "Q16769769",
  "titles": {
    "canonical": "今泉力哉",
    "normalized": "今泉力哉",
    "display": "<span class=\"mw-page-title-main\">今泉力哉</span>"
  },
  "pageid": 2968576,
  "thumbnail": {
    "source": "https://upload.wikimedia.org/wikipedia/commons/thumb/7/7b/Imaizumi_Rikiya_from_%22by_the_window%22_at_Red_Carpet_of_the_Tokyo_International_Film_Festival_2022_%2852461542085%29.jpg/330px-Imaizumi_Rikiya_from_%22by_the_window%22_at_Red_Carpet_of_the_Tokyo_International_Film_Festival_2022_%2852461542085%29.jpg",
    "width": 320,
    "height": 480
  },
  "originalimage": {
    "source": "https://upload.wikimedia.org/wikipedia/commons/7/7b/Imaizumi_Rikiya_from_%22by_the_window%22_at_Red_Carpet_of_the_Tokyo_International_Film_Festival_2022_%2852461542085%29.jpg",
    "width": 5464,
    "height": 8192
  },
  "lang": "ja",
  "dir": "ltr",
  "revision": "106477110",
  "tid": "c8df3012-9225-11f0-aa24-a0e8d35e97fd",
  "timestamp": "2025-09-15T11:19:03Z",
  "description": "日本の映画監督 (1981-)",
  "description_source": "central",
  "content_urls": {
    "desktop": {
      "page": "https://ja.wikipedia.org/wiki/%E4%BB%8A%E6%B3%89%E5%8A%9B%E5%93%89",
      "revisions": "https://ja.wikipedia.org/wiki/%E4%BB%8A%E6%B3%89%E5%8A%9B%E5%93%89?action=history",
      "edit": "https://ja.wikipedia.org/wiki/%E4%BB%8A%E6%B3%89%E5%8A%9B%E5%93%89?action=edit",
      "talk": "https://ja.wikipedia.org/wiki/%E3%83%8E%E3%83%BC%E3%83%88:%E4%BB%8A%E6%B3%89%E5%8A%9B%E5%93%89"
    },
    "mobile": {
      "page": "https://ja.m.wikipedia.org/wiki/%E4%BB%8A%E6%B3%89%E5%8A%9B%E5%93%89",
      "revisions": "https://ja.m.wikipedia.org/wiki/Special:History/%E4%BB%8A%E6%B3%89%E5%8A%9B%E5%93%89",
      "edit": "https://ja.m.wikipedia.org/wiki/%E4%BB%8A%E6%B3%89%E5%8A%9B%E5%93%89?action=edit",
      "talk": "https://ja.m.wikipedia.org/wiki/%E3%83%8E%E3%83%BC%E3%83%88:%E4%BB%8A%E6%B3%89%E5%8A%9B%E5%93%89"
    }
  },
  "extract": "今泉 力哉 は、日本の映画監督。福島県郡山市出身。キリスト教徒。",
  "extract_html": "<p><b>今泉 力哉</b> は、日本の映画監督。福島県郡山市出身。キリスト教徒。</p>"
}
```



## 参考
<a>https://qiita.com/kahibella/items/5218cba7179e66beebd3</a>  
<a>https://qiita.com/ko1nksm/items/30982a5f357f26ae166f</a>  
<a>https://qiita.com/Zack-yutapon/items/ec2262eaedc371b3ed9d</a>  
<a></a>  
