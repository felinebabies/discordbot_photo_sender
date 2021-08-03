# discordbot_photo_sender
指定ディレクトリを監視し、ファイルが増えたらDiscordに投稿するスクリプト

Ruby2.5.1での動作を確認済み。

## 簡単な使用方法

bundlerをインストール済みであること。

当スクリプトが存在するディレクトリで、必須gemのインストールを行う。

    bundle install
  
付属のsample.envをコピーし、.envファイルを作成する。

    cp sample.env .env

.envファイルを編集し、下記必要事項を記入する。

    DISCORD_TOKEN='[discord bot token：ここにbotトークンを記入]'
    DISCORD_CLIENT_ID='[discord client id：ここにbotのクライアントIDを記入]'
    PHOTO_DIR_PASS='/mnt/E/syuji_picture/VRChat：ここにアップロードするために監視するディレクトリパスを記入'
    DISCORD_CHANNEL_NAME='vrchat_photo：ここにファイルをアップロードする先のDiscordチャンネル名を記載する'

スクリプトを起動し、ファイルの監視を始める。

    bundle exec ruby vrchatphoto.rb

監視を終了する場合には、Ctrl+cを入力する。


## Discord botの登録方法

まずDiscordのページでログインします。

<https://discord.com/>

次に、下記URLにアクセスし、bot開発者用ページにアクセスします。


<https://discord.com/developers/applications>


![](image/2021-08-02-00-07-39.png)

New Applicationボタンをクリックします。

![](image/2021-08-02-00-08-29.png)

botに使うアプリケーション名を入力し、Createボタンをクリックします。

![](image/2021-08-02-00-08-52.png)

すると、アプリケーションが作られて個別ページに移動します。

![](image/2021-08-02-00-09-52.png)

このページのApplication IDを.envファイルに記載します。

![](image/2021-08-02-00-10-08.png)

Botタブに移動し、Add botボタンをクリックします。

![](image/2021-08-02-00-10-20.png)

Yes, do it!ボタンをクリックします。

![](image/2021-08-02-00-11-04.png)

ボットが生成されます。アイコンの右にあるTOKENのコピーボタンをクリックすることで、ボットのトークンを取得できます。

![](image/2021-08-02-00-12-57.png)

OAuthタブに移動します。

Scopeのチェックリストからbotにチェックを入れ、BOT PERMISSIONSチェックリストではSend MessageとAttach Filesにチェックを入れて、BOT PERMISSIONSの上にあるURLをコピーし、ブラウザのURL欄にに貼り付けて移動します。

![](image/2021-08-02-00-14-32.png)

botをDiscordサーバに追加するための画面が出るので、botを置きたいサーバを選択してはいボタンをクリックします。

![](image/2021-08-03-16-51-12.png)

スクリプトを起動して、動作を確認します。

![](image/2021-08-02-00-18-06.png)

