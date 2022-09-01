require './spec/spec_helper'

# write tests for teacher class
describe Teacher do
  before do
    @teacher = Teacher.new 'age', 'specialization', 'name', 'parent_permission', 'id'
  end

  describe '#new' do
    it 'should return a new teacher object' do
      @teacher.should be_an_instance_of Teacher
    end
  end

  describe '#id' do
    it 'should return the correct id' do
      @teacher.id.should eq 'id'
    end
  end

  describe '#name' do
    it 'should return the correct name' do
      @teacher.name.should eq 'name'
    end
  end

  describe '#age' do
    it 'should return the correct age' do
      @teacher.age.should eq 'age'
    end
  end

  describe '#parent_permission' do
    it 'should return the correct parent_permission' do
      @teacher.parent_permission.should eq 'parent_permission'
    end
  end

  describe '#specialization' do
    it 'should return the correct specialization' do
      @teacher.specialization.should eq 'specialization'
    end
  end

  describe '#type' do
    it 'should return the correct type' do
      @teacher.type.should eq 'teacher'
    end
  end

  describe 'rentals' do
    it 'should return the correct rentals' do
      @teacher.rentals.should eq []
    end
  end
end
