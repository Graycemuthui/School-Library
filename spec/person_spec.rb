require './spec/spec_helper'

# write a test for the person class
describe Person do
  before do
    @people = Person.new 'age', 'name', 'parent_permission', 'id'
  end

  describe '#new' do
    it 'should return a new person object' do
      @people.should be_an_instance_of Person
    end
  end

  describe '#id' do
    it 'should return the correct id' do
      @people.id.should eq 'id'
    end
  end

  describe '#name' do
    it 'should return the correct name' do
      @people.name.should eq 'name'
    end
  end

  describe '#age' do
    it 'should return the correct age' do
      @people.age.should eq 'age'
    end
  end

  describe '#parent_permission' do
    it 'should return the correct parent_permission' do
      @people.parent_permission.should eq 'parent_permission'
    end
  end

  describe '#rentals' do
    it 'should return the correct rentals' do
      @people.rentals.should eq []
    end
  end
end
