@bot = Discordrb::Bot.new token: ENV['TOKEN']

@bot.message(with_text: '!level') do |event|
    level = event.author.username
    lines = IO.readlines("quizloggies.txt", chomp: true)
    event.respond "**#{event.author.mention}** has: ``#{lines.count(level)}🏆``"
end