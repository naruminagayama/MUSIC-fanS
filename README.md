# MUSIC fanS

音楽配信＆コミュニティを中心としたサイトです。<br>
ランキング形式で注目されている人気のアーティストや楽曲、最新コンテンツなどがひと目で分かり、検索機能も充実しています。<br>
アーティストごとにコミュニティ機能があり、情報共有などチャットによるリアルタイムのファン同士の交流も可能です。<br>
活動記録として、ライブ等のイベント参加履歴や日常のことまで何でも記録ができるブログ機能もご利用いただけます。<br>

![image1](https://github.com/naruminagayama/MUSIC-fanS/blob/images/readme_1.png)
![image2](https://github.com/naruminagayama/MUSIC-fanS/blob/images/readme_2.png)
![image3](https://github.com/naruminagayama/MUSIC-fanS/blob/images/readme_3.png)
![image4](https://github.com/naruminagayama/MUSIC-fanS/blob/images/readme_4.png)

# URL

http://music-fans.work<br>
Guest(閲覧用)から、メールアドレスとパスワードは入力せずにログインしていただけます。

# 開発環境

⚫︎Ruby 2.5.7<br>
⚫︎Ruby on Rails 5.2.4<br>
⚫︎MySQL 5.7<br>
⚫︎Nginx<br>
⚫︎Puma<br>
⚫︎AWS<br>
　　⚪︎VPC<br>
　　⚪︎EC2<br>
　　⚪︎RDS<br>
　　⚪︎Route53<br>
⚫︎Capistrano3

# AWS構成図

![image5](https://github.com/naruminagayama/MUSIC-fanS/blob/images/readme_aws.png)

# 機能一覧

⚫︎インクリメンタルサーチ機能の非同期通信(JavaScript)<br>
⚫︎いいね・お気に入り機能の非同期通信(Ajax)<br>
⚫︎ソート(新着・ランキング)機能<br>
⚫︎音楽再生機能(audiojs-rails)<br>
⚫︎Action Cableを用いたチャット機能(WebSocket)<br>
⚫︎Flashメッセージ(toastr-rails)<br>
⚫︎画像スライダー(bgswitcher.js)<br>
⚫︎RakutenWebService

https://docs.google.com/spreadsheets/d/1v2JtfMj2eXq5JMcNgeg0XhbCxGi-YUVebLJnftCRkiw/edit#gid=0

# テスト

RSpec　単体テスト(model)
