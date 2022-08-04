require './spec_helper'

describe Student do
  context 'Create a Student' do
    it 'Should return person name' do
      classroom = double('classroom')
      allow(classroom).to receive(:classroom) { 'classroom1' }

      student = Student.new(classroom, 28, 'John Doe')
      expect(student.classroom).to eq classroom
    end
  end
end
