require './book'
require './class_room'
require './person'
require './rental'
require './student'
require './teacher'
require './inputs'


class App
  attr_accessor :persons, :books, :rentals
  
  def initialize
    @persons = []
    @books = []
    @rentals = []
  end

  def list_books
    puts 'List of all books'
    @books.each { |book| puts "Title: \"#{book.title}\", Author: #{book.author}" }
    puts ''
  end

  def list_people
    puts 'List of all people'
    @persons.each { |person| puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}" }
    puts ''
  end

  def promte_create_person
    puts 'Which type of person you wish to create'
    puts '1. Student'
    puts '2. Teacher'
    print 'Enter selection: '
    person_type = Inputs.new.int_input
    print 'Name: '
    name = Inputs.new.str_input
    print 'Age : '
    age = Inputs.new.int_input
    create_person(person_type, name, age)
  end

  def create_person(person_type, name, age)
    case person_type
    when 1
      print 'Has parent permission? [Y/N]: '
      permission = Inputs.new.bol_input
      permission = (permission == 'Y')
      @persons << Student.new('Unkown', age, name, parent_permission: permission)
      puts "Person created successfully \n\n"
    when 2
      print 'Specialization: '
      specialization = Inputs.new.str_input
      @persons << Teacher.new(specialization, age, name)
      puts "Person created successfully\n\n"
    end
  end

  def promte_create_book
    puts 'Create a book'
    print 'Title: '
    title = get_user_selection('String')
    print 'Author: '
    author = get_user_selection('String')
    create_book(author, title)
    puts "Book created successfully\n\n"
  end

  def create_book(author, title)
    @books << Book.new(title, author)
  end

  def promte_create_rental
    puts 'Create rental'
    puts 'Select a book from the following list by number'
    @books.each_with_index { |book, index| puts "#{index}) Title: \"#{book.title}\", Author: #{book.author}" }
    book_number = get_user_selection('Number')
    puts 'Select a Person from the following list by number'
    @persons.each_with_index do |person, index|
      puts " #{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    person_number = get_user_selection('Number')
    print 'Date: '
    date = get_user_selection('String')
    create_rental(date, book_number, person_number)
    puts "Rental created successfully \n\n"
  end

  def get_user_selection(input_type)
    return Inputs.new.int_input if input_type == 'Number'

    Inputs.new.str_input
  end

  def create_rental(date, book_number, person_number)
    @rentals << Rental.new(date, @books[book_number], @persons[person_number])
  end

  def list_rentals
    puts 'List all rentals'
    print 'Enter ID of person: '
    person_id = Inputs.new.str_input
    puts 'Rentals : '
    @rentals.each do |rent|
      if rent.person.id.to_s == person_id.to_s
        puts "#{rent.class} #{rent.date} | Book: \"#{rent.book.title}\" rented by #{rent.person.name}"
      end
    end
  end
end
