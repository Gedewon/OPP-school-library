require './spec_helper'

describe ClassRoom do
  context 'Create a ClassRoom' do
    it 'Should return class lable true' do
      student = double('student')
      allow(student).to receive(:name) { 'Nia' }

      class_room = ClassRoom.new('ClassB')

      # expect(class_room.add_student(student)).to be_instance_of ClassRoom
      expect(class_room.label).to eq 'ClassB'
    end
  end
end
