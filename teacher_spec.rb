require './spec_helper'

describe Teacher do
  context 'Create a Teacher' do
    it 'Should return permission true' do
      teacher = Teacher.new('Programmer', 28, 'John Doe')
      expect(teacher.can_use_services?).to be true
    end
  end
end
