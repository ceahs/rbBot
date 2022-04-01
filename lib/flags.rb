@questions = ["https://countryflagsapi.com/png/ee", "https://countryflagsapi.com/png/us", "https://countryflagsapi.com/png/de", "https://countryflagsapi.com/png/ae"]
@answers = ["Estonia", "United States of America", "Germany", "United Arab Emirites"]
@bot = Discordrb::Bot.new token: ENV['TOKEN']


@bot.message(with_text: '!flags') do |event|
    questionnum = rand(0..3)
    event.channel.send_embed do |embed|
        embed.title = 'Guess the flag'
        embed.image = Discordrb::Webhooks::EmbedImage.new(url: @questions[questionnum])

        event.user.await(:guess, with_text: @answers[questionnum]) do |guess_event|
            guess = guess_event.message.content.to_s
            if guess == @answers[questionnum]
                guess_event.respond "#{event.author.mention} Well done! **#{@answers[questionnum]}** is correct!"
                quizloggies = event.author.username
                File.open("quizloggies.txt", "a") do |f|
                f << "#{quizloggies}\n"
                break
                end 
            end
        end
    end       
end