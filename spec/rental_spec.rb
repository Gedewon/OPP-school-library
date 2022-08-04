require_relative '../spec_helper'

describe Rental do
  context 'Create a Rental' do
    it 'Should return  true for book object' do
      book = Book.new('Game of thrones', 'Geroge R.R Martin')
      person = Person.new(27, 'John Doe')
      rental = Rental.new('2022-08-04', book, person)

      expect(rental.book).to eq book
    end
  end
end
