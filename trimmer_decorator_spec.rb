require './spec_helper'

describe TrimmerDecorator do
  context 'Use a TrimmerDecorator' do
    it 'Should return trimm string length to < 10  ' do
      decorator = Decorator.new('IsaacMaqueen')

      trimmer_decorator = TrimmerDecorator.new(decorator)

      expect(trimmer_decorator.correct_name.length).to eq 11
    end
  end
end
