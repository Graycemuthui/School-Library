require_relative 'book'
require_relative 'person'
require_relative 'rental'
require_relative 'student'
require_relative 'teacher'

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

  # Create student
  def create_student
    print 'Age:'
    age = gets.chomp
    print 'Name:'
    name = gets.chomp
    print 'Has parent permission? [Y/N]:'
    parent_permission = gets.chomp.downcase
    case parent_permission
    when 'n'
      student = Student.new(age, name, nil, parent_permission: false)
      @people << student
      puts 'Student does not have parent permission'
      student = Student.new(age, nil, name, parent_permission)
    when 'y'
      @people.push(student)
      puts 'Student created successfully'
    end
  end

  # Create teacher
  def create_teacher
    print 'Age:'
    age = gets.chomp
    print 'Name:'
    name = gets.chomp
    print 'Specialization:'
    specialization = gets.chomp
    teacher = Teacher.new(age, specialization, name)
    @people.push(teacher)
    puts 'Teacher created successfully'
  end

  # Create person
  def create_person
    puts 'Do you want to create a Student(1) or a Teacher(2). [Input a number]'
    choice = gets.chomp
    case choice
    when '1'
      create_student
    when '2'
      create_teacher
    else
      puts 'Please enter a valid number 1 or 2'
      nil
    end
  end

  # create rental
  def create_rental
    if @books.size.zero?
      puts 'No book in the library'
    elsif @people.size.zero?
      puts 'No person registered in the library'
    else
      puts 'Select a list from the following list by number'
      @books.each_with_index do |book, index|
        puts "#{index}) Title: #{book.title}, Author: #{book.author}"
      end
      rental_book = gets.chomp.to_i
      puts 'Select a perspn from the following list by number'
      @people.each_with_index do |person, index|
        puts "#{index}) #{person.class} Name: #{person.name} ID:#{person.id} Age:#{person.age}"
      end
      rental_person = gets.chomp.to_i
      print 'Date(YYYY/MM/DD):'
      date = gets.chomp.to_s
      rental_details = Rental.new(date, @books[rental_book], @people[rental_person])
      @rentals.push(rental_details)
      puts 'Rental created successfully'
    end
  end

  # List all rentals for a given person id.
  def list_rental
    if @rentals.empty?
      puts 'No rental is registered'
    else
      puts 'Select a person from the following list by id'
      @people.each do |person|
        puts "ID: #{person.id} Name: #{person.name}"
      end
      print 'Enter ID:'
      id = gets.chomp
      @rentals.each do |rental|
        if rental.person.id.to_i == id.to_i
          puts "Date: #{rental.date}, Book \"#{rental.book.title}\" by #{rental.book.author} "
        end
      end
    end
  end
end
