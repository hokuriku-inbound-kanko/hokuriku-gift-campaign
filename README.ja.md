# hokuriku-gift-campaign

[北陸ギフトキャンペーン](https://welcome-hokuriku.jp)から提供されるオープンな観光調査データ。富山県、石川県、福井県の観光施設でQRコードアンケートを通じて収集されたデータです。

## データ可視化

インタラクティブなチャートやインサイトを閲覧するには:
[https://hokuriku-inbound-kanko.github.io/hokuriku-inbound-kanko-visualization/](https://hokuriku-inbound-kanko.github.io/hokuriku-inbound-kanko-visualization/)

## データ収集

観光客は北陸地方の参加施設でQRコードをスキャンしてアンケートを提出します。データは [welcome-hokuriku.jp](https://welcome-hokuriku.jp) キャンペーンプラットフォームを通じて収集されています。

## データ形式

日次CSVファイルは `daily/YYYY-MM-DD.csv` に格納されています（2024-09-01から開始）。各ファイルには、標準化されたフィールドを持つタイムスタンプ付きのアンケート回答が含まれます。

## 主なアンケートフィールド

データセットには以下が含まれます：

- **人口統計**: 年齢、性別、国籍、世帯収入
- **訪問コンテキスト**: 訪問目的、日本への訪問回数、同伴者、滞在期間、旅行予算
- **情報源**: 主な旅行情報源、キャンペーンの認知経路
- **支出と満足度**: 施設ごとの支出、全体的な満足度、推奨可能性
- **地理・運営データ**: 都道府県、エリア、業種、施設訪問目的

## 自動更新

- 毎日午前3時JSTにキャンペーンサーバーからSFTP経由でデータ取得
- 必要に応じてShift-JISからUTF-8への自動エンコーディング変換
- `update.sh` 経由でGitへの自動コミットおよびGitHubへのプッシュ

## 技術

- **自動化**: SFTP操作に `expect` を使用したBashスクリプト (`update.sh`)
- **データ変換**: エンコーディング正規化のためのDenoベースの `conv-charset.ts`

## ライセンス

CC-BY 4.0 — [北陸インバウンド観光DXデータコンソーシアム](https://github.com/hokuriku-inbound-kanko)。再利用には出典の明記が必要です。
