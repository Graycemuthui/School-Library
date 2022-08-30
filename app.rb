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
    title = get_user_input 'Title:'
    author = get_user_input 'Author:'
    book = Book.new(title, author)
    create_object(Book, @books, title, author)
  end

  # List all books
  def list_books
    if @books.empty?
      puts_message 'No books in the library'
      return
    end
    @books.each do |singlebook|
      puts_message "Title: #{singlebook.title}, Author: #{singlebook.author}"
    end
  end

  # List people
  def list_people
    if @people.empty?
      puts_message 'No person in library'
      return
    end
    @people.each do |person|
      puts_message "[#{person.class}], Name:#{person.name}, ID:#{person.id}, Age:#{person.age}"
    end
  end

  # Create student
  def create_student
    age = get_user_input 'Age:'
    name = get_user_input 'Name:'
    parent_permission = get_user_input 'Has parent permission? [Y/N]:'
    case parent_permission
    when 'n'
      create_object(Student, @people, age, nil, name, parent_permission)
      @people.push(student)
      puts_message 'Student does not have parent permission'
    when 'y'
      create_object(Student, @people, age, nil, name, parent_permission)
      puts_message 'Student created successfully'
    end
  end

  # Create teacher
  def create_teacher
    age = get_user_input 'Age: '
    name = get_user_input 'Name:'
    specialization = get_user_input 'Specialization:'
    teacher = Teacher.new(age, specialization, name)
    create_object(Teacher, @people, id, age, name)
  end

  # Create person
  def create_person
    puts_message 'Do you want to create a Student(1) or a Teacher(2). [Input a number]'
    choice = get_user_input
    case choice
    when '1'
      create_student
    when '2'
      create_teacher
    else
      puts_message 'Please enter a valid number 1 or 2'
      nil
    end
  end

  def get_rental_book
    puts_message 'Select a list from the following list by number'
    @books.each_with_index do |book, index|
      puts_message "#{index}) Title: #{book.title}, Author: #{book.author}"
    end
    rental_book = get_user_input.to_i
  end

  def get_rental_person
    puts_message 'Select a person from the following list by number'
    @people.each_with_index do |person, index|
      puts_message "#{index}) #{person.class} Name: #{person.name} ID:#{person.id} Age:#{person.age}"
    end
    rental_person = get_user_input.to_i
  end

  def create_rental
    if @books.size.zero?
      puts_message 'No book in the library'
    elsif @people.size.zero?
      puts_message 'No person registered in the library'
    else
      rental_book = get_rental_book
      rental_person = get_rental_person

      date = get_user_input('Date(YYYY/MM/DD):').to_s
      rental_details = Rental.new(date, @books[rental_book], @people[rental_person])
      create_object(Rental, @rentals, date, book, person)
    end
  end

  # List all rentals for a given person id.
  def list_rental
    if @rentals.empty?
      puts_message 'No rental is registered'
    else
      puts_message 'Select a person from the following list by id'
      @people.each do |person|
        puts_message "ID: #{person.id} Name: #{person.name}"
      end
      id = get_user_input 'Enter ID:'
      @rentals.each do |rental|
        if rental.person.id.to_i == id.to_i
          puts_message "Date: #{rental.date}, Book \"#{rental.book.title}\" by #{rental.book.author} "
        end
      end
    end
  end

  private

  def get_user_input(key = '')
    puts "\n"
    print key
    input = gets.chomp
  end

  def puts_message(message)
    puts "\n"
    puts message
  end
end

def create_object(class_Name, store, *args)
  class_Name.new(*args)
  store.push(class_Name.new(*args))
end
