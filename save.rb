require 'fileutils'
require 'json'
require './app'

def on_exit(app)
  save_person(app)
  save_books(app)
end

def save_person(app)
  persons = []
  app.persons.each do |person|
    if person.class.to_s == 'Student'
      st = { name: person.name, age: person.age, permission: person.parent_permission, type: person.class }
      persons.push(st)
    else
      teacher = { name: person.name, age: person.age, specialization: person.specialization, type: person.class }
      persons.push(teacher)
    end
  end
  File.new('person.json') unless File.exist?('person.json')
  File.write('person.json', JSON.generate(persons))
end

def save_books(app)
  books = []
  app.books.each do |book|
    book = { title: book.title, author: book.author }
    books.push(book)
  end
  File.write('books.json', JSON.generate(books))
end

def read_books(app)
  File.write('books.json', JSON.generate([])) unless File.exist?('books.json')

  books = JSON.parse(File.read('books.json'))
  books.each do |book|
    book = Book.new(book['title'], book['author'])
    app.books.push(book)
  end
end

def save_rental(date, book_number, person_number)
  rentals = JSON.parse(File.read('rentals.json'))
  st = { date: date, person_number: person_number, book_number: book_number }
  rentals.push(st)
  File.write('rentals.json', rentals.to_json)
end

def read_person(app)
  File.write('person.json', JSON.generate([])) unless File.exist?('person.json')

  persons = JSON.parse(File.read('person.json'))
  persons.each do |person|
    if person['type'] == 'Student'
      student = Student.new('Unkown', person['age'], person['name'], parent_permission: person['permission'])
      app.persons.push(student)
    else
      teacher = Teacher.new(person['specialization'], person['age'], person['name'])
      app.persons.push(teacher)
    end
  end
end

def read_rental(app)
  File.write('rentals.json', JSON.generate([])) unless File.exist?('rentals.json')

  rentals = JSON.parse(File.read('rentals.json'))
  rentals.each do |rental|
    rental = Rental.new(rental['date'], app.books[rental['book_number']], app.persons[rental['person_number']])
    app.rentals.push(rental)
  end
end
