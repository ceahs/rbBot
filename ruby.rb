require 'discordrb'
require './messagelogger.rb'

@cat = 'https://source.unsplash.com/random/featured/?cat'
@dog =
@kyliejenner =
@bot = Discordrb::Bot.new token: 'OTQzNzc1NDg0NzQ2MDM1MjUw.Yg39ag.JQNn3OlBfFKcTM7YxBJU21xsm2Y'


def botinit()
puts "Welcome to my Ruby Discord Bot."  
    puts "What would you like to do?"
    puts "1. View message log"
    puts "2. Send an image"
    puts "3. Play rock, paper scissors"
    puts "4. Guessing Game"
    puts "5. Kahoot Motivation"
    puts "6. Play a text story game"
    puts "7. What should I watch on YouTube today?"
    selection = gets.chomp
    if selection == "1"
        message()
    end

    if selection == "2"
        image()
    end

end

def message()
    puts "What would you like the message to be?"
    @message = gets.chomp
    
    @bot.message(with_text: '!message') do |event|
        event.respond @message
        botinit()
    end
end

def image()
    puts "What image would you like to send?"
    puts "1. Cat"
    puts "2. Dog"
    puts "3. Kylie Jenner"
    @image = gets.chomp

    @bot.message(with_text: '!image') do |event|
        if @image == "1"
            event.channel.send_embed do |embed|
                embed.title = ['Heres a cat!']
                embed.image = Discordrb::Webhooks::EmbedImage.new(url: "https://source.unsplash.com/random/featured/?cat")
                end
        else 
            puts "Failed"
        end
    end
end

# @bot.message do |event|
#     begin
#     loggies = event.content, event.author, event.timestamp, event.channel.name
#         File.open("loggies.txt", "a") do |f|
#         f << "#{loggies}\n"
#     end
#     rescue
#         puts "rescued"
#     end
# end

@questions = ["What is the capital city of Australia?", "What is 2 + 2?", "What flag is this?"]
@answers = ["ACT", "4", "Estonia"]

def quizgame
    game = rand(0..2)
    puts @questions[game]
    puts "test"
        @bot.message(with_text: '!startquiz') do |event|
        begin
        event.respond @questions[game]
            event.user.await(:guess) do |guess_event|
            guess = guess_event.message.content.to_s
            if guess == @answers[game]
            guess_event.respond 'That is the correct answer!'
            else
            puts "Incorrect"
            end
    end
        rescue 
        puts "rescued"    
        end
    end
end

quizgame()

@bot.run

botinit

