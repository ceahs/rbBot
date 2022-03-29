require 'discordrb'
require 'dotenv/load'




def botinit()
puts "Welcome to my Ruby Discord Bot."  
    puts "What would you like to do?"
    puts "1. View message log"
    puts "2. Send an image"
    puts "3. Play rock, paper scissors"
    puts "4. Flags"
    puts "5. Kahoot Motivation"
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
#     
#     end
#     rescue
#         puts "rescued"
#     end
# end



end

@bot.message(with_text: '!winners') do |event|
    
    winners = event.author.username
    event.respond "#{event.author.username} has won #{log.count(winners)} times!"
end

@questions = ["What is the capital city of Australia?", "What is 2 + 2?", "What flag is this?"]
@answers = ["ACT", "4", "Estonia"]



@bot.run

botinit

