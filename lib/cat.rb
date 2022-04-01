@bot = Discordrb::Bot.new token: ENV['TOKEN']

@bot.message(with_text: '!cat') do |event|
    event.channel.send_embed do |embed|
        embed.title = ['Heres a cat!']
        embed.image = Discordrb::Webhooks::EmbedImage.new(url: "https://source.unsplash.com/random/featured/?cat")
end