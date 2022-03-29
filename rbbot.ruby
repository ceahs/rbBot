require 'launchy'
require 'discordrb'
require 'dotenv/load'

@bot = Discordrb::Bot.new token: ENV['TOKEN']

# def loginscreen
#     puts "         __    ____        __ "
#     puts "   _____/ /_  / __ )____  / /_"
#     puts "  / ___/ __ |/ __  / __ |/ __/"
#     puts " / /  / /_/ / /_/ / /_/ / /_  "
#     puts "/_/  /_.___/_____/|____/|__/  "
#     puts
#     puts
#     puts 
#     puts "1. Log In"
#     puts "2. Create an Account"
# end


# choice = gets.chomp
#     if choice == "1"
#         puts "Please enter the password:"
#         password = gets.chomp.to_s

#     elsif choice == "2"
#         puts "Welcome to rbBot!"
#         puts "We will help you create an account and set-up the bot."
#         puts "First you have to invite the bot to your Discord server."
#         puts "Press enter to continue.."
#         gets
#         Launchy.open('https://discord.com/oauth2/authorize?client_id=943775484746035250&permissions=0&scope=bot%20applications.commands')
#         puts "After you have added the bot, please type '!authenticate' in any channel, to finish the set-up in Discord."
# end

@questions = ["https://upload.wikimedia.org/wikipedia/commons/thumb/8/8f/Flag_of_Estonia.svg/255px-Flag_of_Estonia.svg.png", "Vatican", "Germany"]
@answers = ["Estonia", "Vatican", "Germany"]

def geoquiz
    @bot.message(with_text: '!flags') do |event|
    questionnum = rand(0..0)
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
end

@bot.message(with_text: '!level') do |event|
    level = event.author.username
    f = File.open("quizloggies.txt", "r")
    f.each { |line|
    puts line.count(level)
    }
    
    
    #event.respond "**#{event.author.mention}** has: ``#{lines.count(level)}🏆``"
end

geoquiz()
@bot.run
