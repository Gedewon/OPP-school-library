require './capitalize_decorator'
require './trimmer_decorator'
require './nameable'

class Person < Nameable
  attr_accessor :name, :age, :rentals
  attr_reader :id, :parent_permission

  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @id = Random.rand(1..1000)
    @age = age
    @name = name
    @parent_permission = parent_permission
    @rentals = []
  end

  def add_rental(rental)
    @rentals.push(rental)
    rental.person = self
  end

  def correct_name
    @name
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  private

  def of_age?
    @age >= 18
  end
end
