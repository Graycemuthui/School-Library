require 'json'
require_relative 'JSON_addition/book_addition'
require_relative 'book'
require_relative 'student'
require_relative 'teacher'
require_relative 'rental'

module LocalStorage
# @rental file
# @books file
# @person file

def read_books
  if File.zero?("books.json")
    jsonArr = "[]"
  else
    jsonArr = File.read("books.json")        
  end
  all_books = JSON.parse(jsonArr, create_additions: true)
end

  def readData
# Check if data exist before now
# If yes, read previous data and append on it
# else, create new data and store it.    
  end

  def writeData(object) 
    if object.instance_of? Book        
      saveObject("books.json", object)
    elsif object.instance_of? Student or object.instance_of? Teacher
      saveObject("person.json", object)    
    elsif object.instance_of? Rental
      saveObject("rentals.json", object)
    else
      puts "none worked"
    end
  end

  def saveObject(filename, book)
    if File.zero?(filename)
      arrParsed = []
    else
      jsonArr = File.read(filename)
      arrParsed = JSON.parse(jsonArr)      
    end 
    arr = [*arrParsed, book]
    json = JSON.generate(arr)
    File.open(filename, "w") do |file| 
      file.write(json)
      file.close()
    end
  end
end


puts "What is the title of the book?"
title = gets.chomp
puts "Who is the author?"
author = gets.chomp

book = Book.new(title, author)

def read_books
  if File.zero?("books.json")
    jsonArr = "[]"
  else
    jsonArr = File.read("books.json")        
  end
  all_books = JSON.parse(jsonArr, create_additions: true)
  all_books = all_books.map do |obj|
   JSON.parse(obj)
  end
end

p read_books

def readData
  # Check if data exist before now
  # If yes, read previous data and append on it
  # else, create new data and store it. 
end


