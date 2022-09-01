require './spec/spec_helper'

# write tests for classroom class
describe Classroom do
  before do
    @classroom = Classroom.new 'student'
  end

  describe '#new' do
    it 'should return a new classroom object' do
      @classroom.should be_an_instance_of Classroom
    end

    # it should return the correct student

    describe '#student' do
      it 'should return the correct student' do
        @classroom.student.should eq []
      end
    end
  end
end
