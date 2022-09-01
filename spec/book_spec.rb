require './spec/spec_helper'

# write a test for the book class
describe Book do
  before do
    @books = Book.new 'Title', 'Author', 'isbn'
  end

  describe '#new' do
    it 'should return a new book object' do
      @books.should be_an_instance_of Book
    end
  end

  describe '#title' do
    it 'should return the correct title' do
      @books.title.should eq 'Title'
    end
  end

  describe '#author' do
    it 'should return the correct author' do
      @books.author.should eq 'Author'
    end
  end

  describe '#isbn' do
    it 'should return a random isbn' do
      @books.isbn.should eq 'isbn'
    end
  end
end
