# Dockerのログの確認方法

## Docker Compose
### docker compose logs
全サービスのログを確認する。
### docker compose logs --tail=数値
--tailで指定した最後の数行のみ表示する。例：最後の50行のみ表示`docker compose logs --tail=50`
### docker compose logs [サービス名]
特定サービスのログのみを表示する。例：appのみ表示`docker compose logs app`
### docker compose logs -f
ログをリアルタイムで追跡する。特定のサービスに対して追跡する場合は、`docker compose logs -f [サービス名]`


## Docker
### docker logs [コンテナID]
コンテナIDは`docker ps -a`で確認できる。
`docker logs [コンテナID] -f`で、実行時のログをリアルタイムで確認（ログの追跡）ができる。

### エラーログの確認方法
- `docker logs [コンテナID] 1>/dev/null`で、エラーログのみを表示  
- `docker logs [コンテナID] 2>dev/null`で、エラーログ以外を表示 

## 参考
<a>https://qiita.com/P-man_Brown/items/17d714f1fd1e6077b67e</a>  
<a>https://qiita.com/Q_Udon/items/4bcbf9f1a919479e01dd</a>
