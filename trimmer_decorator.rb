require './decorator'

class TrimmerDecorator < Decorator
  def correct_name
    @nameable.correct_name.slice! 10..-1
  end
end
