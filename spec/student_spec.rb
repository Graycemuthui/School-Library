require './spec/spec_helper'

# write tests for student class
describe Student do
  before do
    @student = Student.new 'age', 'classroom', 'name', 'parent_permission', 'id'
  end
  describe '#new' do
    it 'should return a new student object' do
      @student.should be_an_instance_of Student
    end
  end

  describe '#id' do
    it 'should return the correct id' do
      @student.id.should eq 'id'
    end
  end

  describe '#name' do
    it 'should return the correct name' do
      @student.name.should eq 'name'
    end
  end

  describe '#age' do
    it 'should return the correct age' do
      @student.age.should eq 'age'
    end
  end

  describe '#parent_permission' do
    it 'should return the correct parent_permission' do
      @student.parent_permission.should eq 'parent_permission'
    end
  end

  describe '#classroom' do
    it 'should return the correct classroom' do
      @student.classroom.should eq 'classroom'
    end
  end

  describe '#rentals' do
    it 'should return the correct rentals' do
      @student.rentals.should eq []
    end
  end
end
