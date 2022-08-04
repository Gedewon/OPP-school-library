require_relative '../spec_helper'

describe CapitalizeDecorator do
  context 'Use a TrimmerDecorator' do
    it 'Should return capitalized person should capitalized' do
      person = Person.new(22, 'maximilianus')
      capitalized_person = CapitalizeDecorator.new(person)
      expect(capitalized_person.correct_name).to eq 'maximilianus'.capitalize
    end
  end
end
