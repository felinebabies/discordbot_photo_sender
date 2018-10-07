require 'bundler'
Bundler.require

Dotenv.load

VRCHAT_PHOTO_DIR = ENV["PHOTO_DIR_PASS"]

targetchannel = "bot_testingfield"

imgfiles = Dir.glob("#{VRCHAT_PHOTO_DIR}/*.png")

def post_photo(botobj, targetch, imagepath, caption)
    botobj.send_file(targetch, File.open(imagepath, 'r'), caption: caption)
end

# Discord botを初期化
bot = Discordrb::Bot.new (
    {
        :token => ENV["DISCORD_TOKEN"],
        :client_id => ENV["DISCORD_CLIENT_ID"]
    }
)

bot.run :async

# チャンネル情報を取得
ch_id = bot.find_channel(targetchannel).first.id

if ch_id != nil then
    listener = Listen.to(VRCHAT_PHOTO_DIR) do |modified, added, removed|
        added.each do |additem|
            post_photo(bot, ch_id, additem, File.basename(additem))
            puts "画像を投稿しました：#{additem}"
        end
    end
    listener.start
    sleep
end

bot.stop
