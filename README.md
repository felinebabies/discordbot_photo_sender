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
