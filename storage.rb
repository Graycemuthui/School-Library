require 'json'
require_relative 'book'
require_relative 'student'
require_relative 'teacher'
require_relative 'rental'

module LocalStorage
  def read_books
    jsonArr = if File.zero?('./files/books.json')
                '[]'
              else
                File.read('./files/books.json')
              end
    all_books = JSON.parse(jsonArr)
    @books = all_books.map do |book|
      Book.new(book['title'], book['author'], book['isbn'])
    end
  end

  def read_people
    jsonArr = if File.zero?('./files/person.json')
                '[]'
              else
                File.read('./files/person.json')
              end
    all_persons = JSON.parse(jsonArr)
    @people = all_persons.map do |person|
      case person['type']
      when 'teacher'
        Teacher.new(person['age'], person['specialization'], person['name'], person['parent_permission'], person['id'])
      when 'student'
        Student.new(person['age'], nil, person['name'], person['parent_permission'], person['id'])
      end
    end
  end

  def read_rentals
    jsonArr = if File.zero?('./files/rentals.json')
                '[]'
              else
                File.read('./files/rentals.json')
              end
    all_rentals = JSON.parse(jsonArr)
    @rentals = all_rentals.map do |rental|
      book = @books.find { |item| item.isbn == rental['book']['isbn'] }
      person = @people.find { |item| item.id == rental['person']['id'] }
      Rental.new(rental['date'], book, person)
    end
  end

  def save_all_data
    save_books
    save_people
    save_rentals
  end

  def read_all_data
    read_books
    read_people
    read_rentals
  end

  private

  def save_books
    obj = @books.map do |book|
      { isbn: book.isbn, title: book.title, author: book.author, rentals: map_rentals(book.rentals) }
    end
    saveObject('./files/books.json', obj)
  end

  def save_people
    obj = @people.map do |person|
      if person.instance_of? Student
        { id: person.id, name: person.name, age: person.age, parent_permission: person.parent_permission,
          type: person.type }
      elsif person.instance_of? Teacher
        {
          id: person.id,
          name: person.name,
          age: person.age,
          parent_permission: person.parent_permission,
          specialization: person.specialization,
          type: person.type
        }
      end
    end
    saveObject('./files/person.json', obj)
  end

  def map_rentals(rentalsArr)
    obj = rentalsArr.map do |rental|
      if rental.person.instance_of? Teacher
        { date: rental.date,
          book: { isbn: rental.book.isbn, title: rental.book.title, author: rental.book.author },
          person: { id: rental.person.id, name: rental.person.name, age: rental.person.age,
                    parent_permission: rental.person.parent_permission,
                    specialization: rental.person.specialization,
                    type: rental.person.type } }
      else
        { date: rental.date,
          book: { isbn: rental.book.isbn, title: rental.book.title, author: rental.book.author },
          person: { id: rental.person.id, name: rental.person.name, age: rental.person.age,
                    parent_permission: rental.person.parent_permission,
                    type: rental.person.type } }
      end
    end
  end

  def save_rentals
    obj = map_rentals(@rentals)
    saveObject('./files/rentals.json', obj)
  end

  def saveObject(filename, obj)
    File.open(filename, 'w') do |file|
      file.write(JSON.generate(obj))
      file.close
    end
  end
end
