@bot = Discordrb::Bot.new token: ENV['TOKEN']

@bot.message do |event|
    event.message = msg
    event.author = auth
        File.open("loggies.txt", "a") do |f|
        f << "MESSAGE: #{msg}, AUTHOR: #{auth}\n"
    end 
end