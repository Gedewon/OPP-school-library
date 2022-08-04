require './spec_helper'

describe Person do
  context 'Create a person' do
    it 'Should return person name' do
      person = Person.new(28, 'John Doe')
      expect(person.correct_name).to eq 'John Doe'
    end
  end
end
