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
end
