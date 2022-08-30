require './app'

class Main
  puts 'Welcome to School Library App'
  puts "\n"

  def self.option
    puts 'Please choose an option by entering a number:'
    @menu = {
      '1' => 'List all books',
      '2' => 'List all people.',
      '3' => 'Create a person (teacher or student, not a plain Person)',
      '4' => 'Create a book.',
      '5' => 'Create a rental',
      '6' => 'List all rentals for a given person id.',
      '7' => 'Exit'
    }
    @menu.each do |key, menu|
      puts "#{key} - #{menu}"
    end
    Integer(gets.chomp)
  end

  app = App.new

  loop do
    case option
    when 1
      app.list_books
    when 2
      app.list_people
    when 3
      app.create_person
    when 4
      app.create_book
    when 5
      app.create_rental
    when 6
      app.list_rental
    when 7
      puts 'Thank you for using this app'
      exit
    else
      puts 'Invalid Option. Enter number between 1 an 7'
    end
  end
end

def main_call
  Main.new
end
main_call
