require_relative '../spec_helper'

describe TrimmerDecorator do
  context 'Use a TrimmerDecorator' do
    it 'Should return capitalized person should capitalized' do

      person = Person.new(22, 'maximilianus');
      capitalizedPerson = CapitalizeDecorator.new(person);
      expect(capitalizedPerson.correct_name).to eq 'maximilianus'.capitalize
   
    end
  end
end
