require 'launchy'
require 'discordrb'
require 'dotenv/load'
require 'down'
require './lib/flags.rb'
require './lib/cat.rb'
require './lib/level.rb'
require './lib/logger.rb'



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

    puts "\e[H\e[2J"
    puts "         __    ____        __ "
    puts "   _____/ /_  / __ )____  / /_"
    puts "  / ___/ __ |/ __  / __ |/ __/"
    puts " / /  / /_/ / /_/ / /_/ / /_  "
    puts "/_/  /_.___/_____/|____/|__/  "
    puts
    puts
    puts 
    puts "1. Log In"
    puts "2. Create an Account"

choice = gets.chomp

    if choice == "1"
        login()

    elsif choice == "2"
        puts "Welcome to rbBot!"
        puts "We will help you create an account and set-up the bot."
        puts "First you will need to create a bot user, and then get the client ID, also, save the token while you are there."
        puts "Press enter to continue.."
        gets
        Launchy.open('https://discord.com/developers/applications')
        puts "After you have made a bot user, and saved the client ID, and token, click enter to continue.."
        gets
        puts "\e[H\e[2J"
        puts "Please put in your bots client ID."
        clientid = gets.chomp
        puts "Please put in your bots token."
        token = gets.chomp
            File.open(".env", "w+") { |f|
            f << "TOKEN=#{token}"
            }
        puts "Now that is complete, all we need to do is invite the bot to your server, and you are done! Click enter to continue.."
        gets
        puts "\e[H\e[2J"
        Launchy.open("https://discord.com/oauth2/authorize?client_id=#{clientid}&permissions=0&scope=bot%20")
        puts "Invite the bot to any server then click enter to continue.."
        gets
        puts "Now the final step. Lets get your password set-up so you can start using the bot!"
        puts "Press enter to complete the set-up.."
        gets 
        verification()
    else
        puts "invalid input"
end







    






@bot = Discordrb::Bot.new token: ENV['TOKEN']
@bot.run