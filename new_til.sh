#!/bin/bash

# 引数チェック
if [ -z "$1" ] || [ -z "$2" ]; then
  echo "⚠️ 使い方: ./new_til.sh YYYYMMDD ファイル名.md"
  echo "例:    ./new_til.sh 20250805 Ruby配列まとめ.md"
  exit 1
fi

DATE="$1"
FILENAME="$2"
DIR="$DATE"

# ディレクトリ作成
mkdir -p "$DIR"

# テンプレートを指定ファイル名でコピー
cp template.md "$DIR/$FILENAME"

echo "✅ 作成しました: $DIR/$FILENAME"
