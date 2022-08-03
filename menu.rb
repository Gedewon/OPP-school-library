require './save'
require './app'
class Menu
  def menu
    puts "\nPlease choose an option by entering a number:\n\n"
    puts '1. List all Books.'
    puts '2. List all People.'
    puts '3. Create a Person.'
    puts '4. Create a Book.'
    puts '5. Create a Rental.'
    puts '6. List all entals for a given person id.'
    puts '7. Exit'
  end

  def print_menu(app) # rubocop:disable Metrics/CyclomaticComplexity
    loop do
      menu
      input = user_input
      case input
      when 1 then app.list_books
      when 2 then app.list_people
      when 3 then app.promte_create_person
      when 4 then app.promte_create_book
      when 5 then app.promte_create_rental
      when 6 then app.list_rentals
      else 
       save_person(app) 
       save_rental(app)
      break
      end
      break unless input.positive? && input < 8
    end
  end

  def user_input
    input = gets.chomp.to_i
    while input > 7 || input < 1
      puts 'Please enter a valid option between 1 to 7: '
      input = gets.chomp.to_i
    end
    input
  end
end
