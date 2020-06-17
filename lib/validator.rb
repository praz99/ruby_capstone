class Validator
  def choice_valid?(choice)
    choice.between?('1', '3') ? true : false
  end

  def position_valid?(position)
    position.between?('1', '215') ? true : false
  end
end
