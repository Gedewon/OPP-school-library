require_relative '../spec_helper'

describe TrimmerDecorator do
  context 'Use a TrimmerDecorator' do
    it 'Should return trimm string length to < 10  ' do
      person = Person.new(22, 'maximilianus');

      capitalizedTrimmedPerson = TrimmerDecorator.new(person);

      expect(capitalizedTrimmedPerson.correct_name).to eq 'maximilian'
    end
  end
end
