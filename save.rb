require 'fileutils'
require 'json'
require './app'

def save_person(app)
  persons = []
  app.persons.each do |person|
    if person.class.to_s == 'Student'
      st = {name: person.name, age: person.age, permission: person.parent_permission}
      persons.push(st)
    else
      teacher = {name: person.name, age: person.age, specialization: person.specialization}
      persons.push(teacher)
    end
  end
     File.write('person.json', JSON.generate(persons))
end

def save_book(app)
end

def save_rental(app)
end



