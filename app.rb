class Entry
  attr_accessor :deutsch, :english
  def initialize(deutsch, english)
    @deutsch = deutsch
    @english = english
  end

  puts $words

  def tostring
    return @deutsch + " - " + @english
  end
end

$words = [Entry.new("hallo", "hello")]

def save
  File.open("words.txt", "w") do |f|
    for i in $words
      f.write(i.tostring() + "\n")
    end
  end
end

def load
  File.open("words.txt", "r") do |f|
    f.each_line do |line|
      $words.push(Entry.new(line.split(" - ")[0], line.split(" - ")[1]))
    end
    puts "Loaded " + $words.length.to_s + " words"
  end
end

def add
  while true
    puts "Deutsch: "
    deutsch = gets.chomp
    if deutsch == "#end"
      break
    end
    puts "English: "
    english = gets.chomp
    if english == "#end"
      break
    end
    $words.push(Entry.new(deutsch, english))
  end
end

def ask
  while true
    random = rand($words.length)
    puts "English word from " + $words[random].deutsch + ": "
    english = gets.chomp
    if english == "#end"
      break
    end
    if $words[random].english.chomp == english
      puts "Correct!"
    else
      puts "Wrong! The answer was #{$words[random].english}"
    end
  end
end

def list
  for i in $words
    puts i.tostring
  end
end

while true
  puts "Commands: add, ask, list, exit, save, load"
  command = gets.chomp
  if command == "add"
    add
  elsif command == "ask"
    ask
  elsif command == "list"
    list
  elsif command == "exit"
    break
  elsif command == "save"
    save
  elsif command == "load"
    load
  else
    puts "Invalid command"
  end
end
