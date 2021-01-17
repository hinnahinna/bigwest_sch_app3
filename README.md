# 勤怠管理アプリ

# 概要
シフト表作成者の業務改善ための勤怠管理アプリです。<br />
従業員ユーザが勤怠管理アプリにシフトを申請し、店長ユーザが申請されたシフトを一元管理できます。<br />
従業員個別に希望シフトをヒヤリングして、Excelでシフト表を作成する手間を無くし、<br />
シフト作成業務に割く時間を軽減できます。

# 制作背景
知人のコンビニフランチャイズ経営者の方からの要望がきっかけで作成しました。<br />
現状でのシフト表の作成方法は、店長がアルバイト・パートの方からLINEなどで希望シフトを聞き、EXCELに手作業で落とし込むというものとなっています。<br />
しかし、手作業でやると時間がかかる、シフトの作成ミスが頻発しているということを聞き、<br />
改善できないかと考えたことが本アプリを作成しようとしたきっかけです。

# URL
https://www.schedulemanagement.work/
- ゲストログイン機能搭載

# 使用技術
* HTML
* CSS / Bootstrap
* JavaScript / jQuery / Ajax
* Ruby 2.7.1
* Ruby on Rails 6.0.3.2
* nginx（Webサーバ）
* Puma（アプリケーションサーバ）
* Git / GitHub
* AWS(VPC,ECS,Route53,ACM,ALB,IAM,RDS for MySQL 5.7)
* Docker / Docker-compose
* CircleCI
* RSpec
* Visual Studio Code (エディタ)

# AWS構成図
[![Image from Gyazo](https://i.gyazo.com/b1e07f086d67a8c83cbf9c0174decb7f.png)](https://gyazo.com/b1e07f086d67a8c83cbf9c0174decb7f)
# ER図
[![Image from Gyazo](https://i.gyazo.com/cfea68de619124993f97e330faa966f7.png)](https://gyazo.com/cfea68de619124993f97e330faa966f7)
# 機能一覧
- ユーザ関連
  - 新規登録
  - ログイン
  - ログアウト
  - プロフィール表示、編集
  - 基本勤務時間帯の登録

- シフト系
  - 申請（複数日付に一括申請可能、予め登録された勤務時間帯のチェックボックスを選択し複数店舗に申請できる）
  - 削除
  - 承認（管理者ユーザ限定、シフト表の申請済シフトをクリックで承認可否を切替）
  - 編集（管理者ユーザ限定、シフト表の申請済シフトをクリックでモーダルウィンドウを表示、承認可否の切替、申請内容変更、削除）
  - シフトの検索、絞り込み機能（ユーザ名、店舗名、申請日、承認可否）
  - 確定シフト表の表示（月単位）
  - 確定シフト表のPNG画像出力
  - 勤務時間帯順でシフト表のユーザ表示順をソート
  - 時間帯ごとのシフト申請数をカウント（時間帯ごとに必要な人員数があるので見える化）

- 管理者設定系
  - 店舗追加（フランチャイズでは複数店舗を経営することがあるので必要）
  - 勤務時間帯項目追加（シフト申請用のチェックボックスの追加）
  - ログイン許可機能（新規ユーザログイン許可に使用）
  - 他ユーザの権限変更（従業員ユーザ⇔店長ユーザ）
  - 他ユーザの削除（退職者アカウントの削除）

- その他
  - レスポンシブ対応
  - Ajax化（シフト作成・承認・編集・削除、新規ユーザログイン許可・権限変更・削除で使用）
  - FlashのToast化
  - 静的コード解析ツール導入（Rubocop）
  - ゲストユーザー機能（編集不可ロジック組込み済）
  - MultiDatespicker導入 (シフト申請、複数日付への一括申請に使用)

# クイックチュートリアル
1. シフトの申請
  - シフト申請先店舗を、申請日、勤務時間帯を選択してシフト申請することが出来ます。
  - 申請したシフトは右欄「申請済みシフト欄」で検索が可能です。
  - 申請直後のシフトは「未承認」の状態になっていますが、店長権限者が当該シフトを承認後に「承認済」に変化します。
  - なお、店長権限者は他ユーザのシフトの申請、検索、承認可否の選択が可能です。
  - さらに、「その他要望」欄では店長向けの要望、コメントを記入することが可能です。
[![Image from Gyazo](https://i.gyazo.com/d69df741220bcee5b4b9cf333642852f.png)](https://gyazo.com/d69df741220bcee5b4b9cf333642852f)
[![Image from Gyazo](https://i.gyazo.com/2c62156534acb532c2cdd9e9b8721ba9.png)](https://gyazo.com/2c62156534acb532c2cdd9e9b8721ba9)

2. スケジュール一覧ページ
  - 承認済のシフトのみ表示されます。
  - 店舗、期間を選択してスケジュールの一覧を表示します。
  - ユーザの表示順はユーザ登録時に設定する、「主な勤務時間帯」順になっています。
  - 勤務時間帯に応じてユーザ欄が色分けされます。
  - 画面全体をキャプチャし、PNG画像出力が可能です。（PC限定限定）
[![Image from Gyazo](https://i.gyazo.com/24b8a263c0c6fa56bb91976143c7e758.png)](https://gyazo.com/24b8a263c0c6fa56bb91976143c7e758)

3. シフト承認ページ（店長権限のみ使用可）
  - 申請されたシフトが表示されます。
  - シフトをクリックすると、「未承認」⇔「承認済」の切り替えが可能です。
  - 未承認のシフトはグレー、承認済のシフトは黒文字で表示されます。
  - ユーザ行下部にシフト申請項目ごとのカウンタがあり、同時刻にいくつシフトが申請されたか確認が可能です。
  - シフト表右欄には各ユーザからの要望コメントが表示されます。
[![Image from Gyazo](https://i.gyazo.com/cd6207eb423285777201456cf10ca769.png)](https://gyazo.com/cd6207eb423285777201456cf10ca769)
[![Image from Gyazo](https://i.gyazo.com/e50e9b3ea51dea74abbb1a2e5e34ea3c.png)](https://gyazo.com/e50e9b3ea51dea74abbb1a2e5e34ea3c)

4. シフト編集ページ（店長権限のみ使用可）
  - 主な機能は「シフト承認ページ」と同じですが、変更点は以下の通りです。
  - シフトをクリックするとモーダルウィンドウが表示され、シフトの編集・削除が出来ます。
[![Image from Gyazo](https://i.gyazo.com/4203a4b0c58acf0ecc4cb4ee67b2e08e.png)](https://gyazo.com/4203a4b0c58acf0ecc4cb4ee67b2e08e)

5. 管理者用設定（店長権限のみ使用可）
  - 店舗、シフト申請項目追加、ユーザ情報編集が出来ます。
  - ユーザ情報編集では、「一般ユーザ」⇔「店長ユーザ（管理者）」の権限切替、<br>
    新規ユーザのログイン許可、アカウント削除が可能です。
[![Image from Gyazo](https://i.gyazo.com/2ebf82fffbdc6fa009b98ab09c12ba38.png)](https://gyazo.com/2ebf82fffbdc6fa009b98ab09c12ba38)

# 課題
- シフト申請画面が一日ごとにしか申請できず不便。
  - テンプレート登録機能を実装予定。
  - 入力性向上のため、Handsontableの導入、GoogleカレンダーやLINE Botとの連携など検討中。
    - 2021/01/01追記：MultiDatespickerの導入により、一日一日しか申請できなかった問題を解決。  複数日付に一括申請できるように変更。
- テストが充実していない。
- UIの洗練不足を感じる。Vue,Vuetifyを導入予定。
