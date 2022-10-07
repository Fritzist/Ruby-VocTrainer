class Entry
  attr_accessor :deutsch, :english
  def initialize(deutsch, english)
    @deutsch = deutsch
    @english = english
  end
  def tostring
    return @deutsch + " - " + @english
  end
end

$words = [Entry.new("hallo", "hello")]

# save the words to a file with a function
def save
  File.open("words.txt", "w") do |f|
    for i in $words
      f.write(i.tostring() + "\n")
    end
  end
end
# load the words from a file with a function
def load
  File.open("words.txt", "r") do |f|
    f.each_line do |line|
      $words.push(Entry.new(line.split(" - ")[0], line.split(" - ")[1]))
    end
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
    if $words[random].english == english
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
  puts "Commands: add, ask, list, exit"
  befehl = gets.chomp
  if befehl == "add"
    add
  elsif befehl == "ask"
    ask
  elsif befehl == "list"
    list
  elsif befehl == "exit"
    break
  elsif befehl == "save"
    save
  elsif befehl == "load"
    load
  else
    puts "Invalid command"
  end
end
