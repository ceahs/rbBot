require 'launchy'
require 'discordrb'
require 'dotenv/load'
require 'down'



def login
    puts "\e[H\e[2J"
    puts "Welcome back to rbBot!"
    print "Please put in your key to start the bot: "
    
    key = gets.chomp
        text = File.read('key.txt')
        if text == key    
            puts "\e[H\e[2J"
            puts "Welcome back!"     
        else 
            puts "Invalid password."
            exit  
        end
end

def verification
    puts "\e[H\e[2J"
    if(File.exist?('key.txt'))
        puts "Logged user detected! Welcome back."
        login()
    else
        puts "\e[H\e[2J"
        puts "Key not detected. Welcome to rbBot"
        @bot.message(with_text: '!authenticate') do |event|
            event.message.delete
            key = rand(1001..9999)
            event.author.pm "||#{key}||"
                File.open("key.txt", "a+") do |f|
                f << "#{key}"
                    puts "You have successfully generated your key. Welcome to rbBot. Please click enter to log-in!"
                    gets
                    login()
            end  
        end
    end 
end


def terminalmode
    puts "         __    ____        __ "
    puts "   _____/ /_  / __ )____  / /_"
    puts "  / ___/ __ |/ __  / __ |/ __/"
    puts " / /  / /_/ / /_/ / /_/ / /_  "
    puts "/_/  /_.___/_____/|____/|__/  "
    puts
    puts
    puts
    puts "1. Download the message log"
    puts "2. Download the geography winner log"
    puts "3. Send an image/message remotely"
    options = gets.chomp
    case options
    when "1"
        puts "1"
    when "2"
        puts "2"
    when "3"
        puts "\e[H\e[2J"
        puts "What message would you like to send?"
        execute = gets.chomp
        puts "Type '!execute' in the channel you want your text to be send to!"
        @bot.message(with_text: '!execute') do |event|
            event.message.delete
            event.respond "#{execute}"
            puts "\e[H\e[2J"
            puts "Command executed!"
            puts "rbBot will resume as normal."
        end
    end 
end


#     puts "\e[H\e[2J"
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
# choice = gets.chomp

#     if choice == "1"
#         login()

#     elsif choice == "2"
#         puts "Welcome to rbBot!"
#         puts "We will help you create an account and set-up the bot."
#         puts "First you will need to create a bot user, and then get the client ID, also, save the token while you are there."
#         puts "Press enter to continue.."
#         gets
#         Launchy.open('https://discord.com/developers/applications')
#         puts "After you have made a bot user, and saved the client ID, and token, click enter to continue.."
#         gets
#         puts "\e[H\e[2J"
#         puts "Please put in your bots client ID."
#         clientid = gets.chomp
#         puts "Please put in your bots token."
#         token = gets.chomp
#             File.open(".env", "w+") { |f|
#             f << "TOKEN=#{token}"
#             }
#         puts "Now that is complete, all we need to do is invite the bot to your server, and you are done! Click enter to continue.."
#         gets
#         puts "\e[H\e[2J"
#         Launchy.open("https://discord.com/oauth2/authorize?client_id=#{clientid}&permissions=0&scope=bot%20")
#         puts "Invite the bot to any server then click enter to continue.."
#         gets
#         puts "Now the final step. Lets get your password set-up so you can start using the bot!"
#         puts "Press enter to complete the set-up.."
#         gets 
#         verification()
#     else
#         puts "invalid input"
# end

puts "\e[H\e[2J"
puts "rbBot initialised. Enjoy!"

@bot = Discordrb::Bot.new token: ENV['TOKEN']

@bot.message(with_text: '!cat') do |event|
    event.channel.send_embed do |embed|
        embed.title = 'Heres a cat! 🐈'
        embed.image = Discordrb::Webhooks::EmbedImage.new(url: "https://source.unsplash.com/random/featured/?cat")
    end
end


@questions = ["https://countryflagsapi.com/png/ee", "https://countryflagsapi.com/png/us", "https://countryflagsapi.com/png/de", "https://countryflagsapi.com/png/ae"]
@answers = ["Estonia", "United States of America", "Germany", "United Arab Emirites"]
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


@bot.message(with_text: '!level') do |event|
    level = event.author.username
    lines = IO.readlines("quizloggies.txt", chomp: true)
        event.respond "**#{event.author.mention}** has: ``#{lines.count(level)}🏆``"
end


@bot.message do |event|
    msg = event.message
    auth = event.author.username
        File.open("loggies.txt", "a") do |f|
        f << "MESSAGE: #{msg}, AUTHOR: #{auth}\n"
    end 
end


@bot.message(with_text: '!help') do |event|
    event.channel.send_embed do |embed|
        embed.title = 'Here is some help!'
        embed.description = "**!flags** \n Generate a random flag! Play VS your friends! \n\n **!level** \n Check how many flag wins you have. \n\n **!cat** \n Get a picture of a cat on-demand. \n\n\n **ADMIN ONLY:** \n **!terminalmode** \n View the bots terminal options."
    end
end
    

@bot.message(with_text: '!terminalmode') do |event|
    event.message.delete
    terminalmode()
end

@bot.run