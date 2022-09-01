require 'json'
require_relative 'book'
require_relative 'student'
require_relative 'teacher'
require_relative 'rental'

module LocalStorage
  # def read_books
  #   if File.zero?("books.json")
  #     jsonArr = "[]"
  #   else
  #     jsonArr = File.read("books.json")
  #   end
  #   all_books = JSON.parse(jsonArr)
  #   all_books.map do |book| 
  #     Book.new(book["title"], book["author"])
  #   end
  # end 

  # def writeData(object) 
  #   if object.instance_of? Book           
  #     saveObject("books.json", { title: object.title, author: object.author, rentals: object.rentals })
  #   elsif object.instance_of? Student or object.instance_of? Teacher
  #     saveObject("person.json", object)    
  #   elsif object.instance_of? Rental
  #     saveObject("rentals.json", object)
  #   else
  #     puts "none worked"
  #   end
  # end

  def save_all_data
    save_books
    save_people
    save_rentals
  end

  private

  def save_books    
    obj = @books.map do |book| 
      { title: book.title, author: book.author, rentals: map_rentals(book.rentals) }
    end
    saveObject("books.json", obj)
  end

  def save_people
    obj = @people.map do |person|      
      if person.instance_of? Student
        { name: person.name, age: person.age, parent_permission: person.parent_permission }
      elsif person.instance_of? Teacher
        { name: person.name, age: person.age, parent_permission: person.parent_permission, specialization: person.specialization }
      end
    end
    saveObject("person.json", obj)
  end

  def map_rentals(rentalsArr)
    obj = rentalsArr.map do |rental|
      if rental.person.instance_of? Teacher
        { date: rental.date, 
          book: { title: rental.book.title, author: rental.book.author},        
          person: { name: rental.person.name, age: rental.person.age,
            parent_permission: rental.person.parent_permission,          
            specialization: rental.person.specialization
          }
        }
      else
        { date: rental.date, 
          book: { title: rental.book.title, author: rental.book.author},        
          person: { name: rental.person.name, age: rental.person.age,
            parent_permission: rental.person.parent_permission           
          }
        }
      end
    end
  end

  def save_rentals
    obj = map_rentals(@rentals)
    saveObject("rentals.json", obj)
  end

  def saveObject(filename, obj)
    File.open(filename, "w") do |file| 
      file.write(JSON.generate(obj))
      file.close()
    end
  end
end
