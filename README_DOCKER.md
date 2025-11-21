# マッチングアプリ - Docker版

## 概要

Deviseを使用したRails認証アプリケーションのDocker版です。

## 必要な環境

- Docker
- Docker Compose

## セットアップと起動

### 1. Dockerイメージのビルド

```bash
docker-compose build
```

### 2. アプリケーションの起動

```bash
docker-compose up
```

または、バックグラウンドで起動する場合：

```bash
docker-compose up -d
```

### 3. アクセス

ブラウザで以下のURLにアクセス：

```
http://localhost:3000
```

## Docker コマンド

### コンテナの停止

```bash
docker-compose down
```

### コンテナとボリュームの削除（データベースもリセット）

```bash
docker-compose down -v
```

### ログの確認

```bash
docker-compose logs -f web
```

### Railsコンソールの起動

```bash
docker-compose exec web rails console
```

### データベースのマイグレーション

```bash
docker-compose exec web rails db:migrate
```

### テストの実行

```bash
docker-compose exec web rails test
```

### コンテナに入る

```bash
docker-compose exec web bash
```

## 機能

- ✅ ユーザー新規登録
- ✅ ログイン/ログアウト
- ✅ プロフィール編集
- ✅ パスワードリセット
- ✅ アカウント削除

## ディレクトリ構成

```
.
├── Dockerfile              # 本番用Dockerfile
├── Dockerfile.dev          # 開発用Dockerfile
├── docker-compose.yml      # Docker Compose設定
├── entrypoint.sh          # エントリーポイントスクリプト
├── app/                   # アプリケーションコード
├── config/                # 設定ファイル
├── db/                    # データベースファイル
└── storage/               # ストレージファイル
```

## トラブルシューティング

### ポート3000が既に使用されている

別のアプリケーションがポート3000を使用している場合、`docker-compose.yml`のポート設定を変更してください：

```yaml
ports:
  - "3001:3000"  # ホストのポート3001をコンテナの3000にマッピング
```

### データベースをリセットしたい

```bash
docker-compose down -v
docker-compose up
```

### Gemfileを変更した場合

```bash
docker-compose build
docker-compose up
```
