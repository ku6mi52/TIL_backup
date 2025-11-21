# Tailwindまとめ

## Tailwindとは
以下がTailwindの特徴である。
- あらゆるスタイリングに対応したクラスをまとめたライブラリ
- クラス名にはh-12 w-12 p-6 max-w-sm mx-autoのように適用したいスタイルの名前を指定をする（BEMのようなレイアウト上意味のある命名をするやり方とは真逆のアプローチ）
- メリットは命名に悩む時間が減る、CSSファイルが無闇に増えない、安全な変更が可能。レスポンシブデザインにも対応
- 保守性はコンポーネント化することでカバーする。つまり、ReactやVue.jsなどのライブラリ使用が前提
- htmlタグにデザイン指示を羅列するような書き方。

## 導入方法
インストール`bin/bundle add tailwindcss-rails`, `bin/rails tailwindcss:install`  
コマンド実行後、  
- app/assets/stylesheets/application.tailwind.css
- tailwind.config.js  
ができる。


## 参考
<a>https://qiita.com/studio_haneya/items/9e0249e9dc1636aa823f</a>
<a>https://tailwindcss.com/</a>  
<a>https://qiita.com/takm-reason/items/5657f61bb547f9a383a7</a>  
<a>https://zenn.dev/yoiyoicho/articles/410a7e3fd892b5</a>  
<a>https://qiita.com/ICU1234/items/4c7c3e974ae290e68792</a>  
