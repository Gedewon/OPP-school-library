require './app'
require './menu'

class Main
  def main
    menu = Menu.new
    app = App.new
    puts('-----------------------------------')
    puts "\nWelcome to OOP School Library App!!\n\n"
    puts('-----------------------------------')
    menu.print_menu(app)
  end
end
main = Main.new
main.main
