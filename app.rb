require_relative 'book'
require_relative 'person'
require_relative 'rental'

class App
  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  # Create a book
  def create_book
    print 'Title:'
    title = gets.chomp
    print 'Author:'
    author = gets.chomp
    book = Book.new(title, author)
    @books.push(book)
    puts 'Book created successfully'
  end

  # List all books
  def list_books
    if @books.empty?
      puts 'No books in the library'
      return
    end
    @books.each do |singlebook|
      puts "Title: #{singlebook.title}, Author: #{singlebook.author}"
    end
  end

  # List people
  def list_people
    if @people.empty?
      puts 'No person in library'
      return
    end
    @people.each do |person|
      puts "[#{person.class}], Name:#{person.name}, ID:#{person.id}, Age:#{person.age}"
    end
  end
end
