class Inputs
  def int_input
    gets.chomp.to_i
  end

  def str_input
    gets.chomp
  end

  def bol_input
    gets[0].capitalize
  end
end