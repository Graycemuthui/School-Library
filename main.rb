require './app'
require_relative 'options'

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

  def exit_app
    exit
  end

  methods = [app.list_books, app.list_people, app.create_person, app.create_book, app.create_rental, app.list_rental, exit_app]

  loop do    
    Options.callMethod(option, methods)    
  end
end

def main_call
  Main.new
end
main_call
