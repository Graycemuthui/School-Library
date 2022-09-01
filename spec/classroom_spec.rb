require './spec/spec_helper'

describe Classroom do
  context 'given parameter' do
    it 'should have name' do
      class_room = Classroom.new('class B')
      expect(class_room.label).to eql 'class B'
    end
  end
end
