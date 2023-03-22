require 'bundler'
Bundler.require

Dotenv.load

VRCHAT_PHOTO_DIR = ENV["PHOTO_DIR_PASS"]

targetchannel = ENV["DISCORD_CHANNEL_NAME"] || "vrchat_photo"

def post_photo(botobj, targetch, imagepath, caption)
    botobj.send_file(targetch, File.open(imagepath, 'r'), caption: caption)
end

# チャンネル名が一致するチャンネルを検索する関数
def find_channel_by_name(bot, channel_name)
    bot.servers.each_value do |server|
      server.channels.each do |channel|
        return channel if channel.name == channel_name
      end
    end
    nil
end

# Discord botを初期化
bot = Discordrb::Bot.new(token: ENV["DISCORD_TOKEN"], client_id: ENV["DISCORD_CLIENT_ID"])

bot.run :async

# チャンネル情報を取得
target_channel = find_channel_by_name(bot, targetchannel)

# チャンネルが取得できた場合
if target_channel != nil then
    ch_id = target_channel.id
end

if ch_id != nil then
    listener = Listen.to(VRCHAT_PHOTO_DIR, force_polling: true) do |modified, added, removed|
        added.each do |additem|
            post_photo(bot, ch_id, additem, File.basename(additem))
            puts "画像を投稿しました：#{additem}"
        end
    end
    listener.start
    sleep
end

bot.sync
bot.stop
