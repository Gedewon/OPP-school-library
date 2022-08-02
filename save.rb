require 'fileutils'
require 'json'
require './app'

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
end


def read_person
  persons = JSON.parse(File.read('person.json'))
  persons.each do |person|
    if person.type == 'Student'
      @persons << Student.new('Unkown', person.age, person.name, person.parent_permission: permission)
    else
      @persons << Teacher.new(person.specialization, person.age, person.name)
    end
  end
end
