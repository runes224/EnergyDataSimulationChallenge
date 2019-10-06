## 目次

- 概要
- URL
- 環境
- 特徴
- 改善点

## 概要

世帯ごとの発電量を可視化するアプリケーション。各世帯の発電量を全世帯の平均、日射量とともに確認できる。

## URL

[https://challenge3-rentohitaka.herokuapp.com/](https://challenge3-rentohitaka.herokuapp.com/)

## 環境

- Docker 19.03.2
- Ruby 2.6.3
- Rails 5.2.3
- PostgreSQL 11.3

## 特徴
- グラフの描画
  - "chartkick"
- scopeを用いて、モデルに関するメソッドを共通化
- csvのインポート処理をバルクインサートで高速化
## 改善点
- データをインポートする際に、事前に用意されていたcsvのカラム名を修正せずともインポートできるようにする
- テストコードを書く
