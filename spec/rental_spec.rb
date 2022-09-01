require './spec/spec_helper'

describe Classroom do
  context 'given parameter' do
    it 'should have book' do
      book = Book.new('The Subtle of not giving a fuck', 'Mark Manson', 1)
      student = Student.new('Grace', 24, 'class B', true, 1)
      rent = Rental.new('22/7/2023', student, book)
      expect(rent.date).to eql '22/7/2023'
    end
  end
end
