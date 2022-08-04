class Nameable
  def correct_name
    raise 'NotImplemtedError'
  end
end

class NameError < Nameable
end

error = NameError.new
error.correct_name