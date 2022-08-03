require 'fileutils'
require 'json'
require './app'


def on_exit(app)
  save_person(app)
  save_rental(app)
end

def save_person(app)
  persons = []
  app.persons.each do |person|
    if person.class.to_s == 'Student'
      st = {name: person.name, age: person.age, permission: person.parent_permission, type: person.class}
      persons.push(st)
    else
      teacher = {name: person.name, age: person.age, specialization: person.specialization, type: person.class}
      persons.push(teacher)
    end
  end
     File.write('person.json', JSON.generate(persons))
end

def save_book(app)
end

def save_rental(app)
  rentals = []
  app.rentals.each do |rental|
  st = {date: rental.date,  book:rental.person.title, person:rental.book.name}
  rentals.push(st)
  end
     File.write('rentals.json', JSON.generate(rentals))
end




def read_person(app)
  persons = JSON.parse(File.read('person.json'))
  persons.each do |person|
    if person['type'] =='Student'
      student = Student.new('Unkown', person['age'], person['name'], parent_permission: person['permission'])
      app.persons.push(student)
    else
      teacher = Teacher.new(person['specialization'], person['age'], person['name'])
      app.persons.push(teacher)
    end
  end
end


def read_rental(arr)
  puts arr
  rentals = JSON.parse(File.read('rentals.json'))
  puts rentals
end
