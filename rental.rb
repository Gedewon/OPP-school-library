class Rental
  attr_reader :person, :book, :date

  def initialize(date, person, book)
    @date = date
    @book = book
    @person = person

    book.rentals.push(self)
    person.rentals.push(self)
  end

  def book=(book)
    @book = book
    book.rentals.push(self) unless book.rentals.include?(self)
  end

  def person=(person)
    @person = person
    person.renatls.push(self) unless person.rentals.include?(self)
  end
end
