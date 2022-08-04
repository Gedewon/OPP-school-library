require '../book'
require '../rental'

describe Book do
  context 'Create a book' do
    it 'Should create book with title and author' do
      book = Book.new('Game of thrones', 'Geroge R.R Martin')
      expect(book.title).to eq 'Game of thrones'
    end
    it 'Should add rental' do
      person = double(27)
      allow(person).to receive(:age) { 27 }

      rental = double('2022-08-04')
      allow(rental).to receive(:date) { self }

      book = Book.new('Game of thrones', 'Geroge R.R Martin')

      # rent = Rental.new('2022-08-04', book, person)
      expect(book.rentals).to respond_to(:length)
    end
  end
end
