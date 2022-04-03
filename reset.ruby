passwordchange = ARGV
    Array.new(passwordchange)
    File.open("key.txt", "w") do |f|
    f << "#{passwordchange[0]}"
    puts "Password successfully changed!"
    end