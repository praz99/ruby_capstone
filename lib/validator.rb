class Validator
  def choice_valid?(choice)
    choice.eql?('1') || choice.eql?('2') || choice.eql?('3') ? true : false
  end

  def position_valid?(position)
    position.to_i.between?(1, 215) ? true : false
  end

  def try_again?(input)
    input.eql?('y') || input.eql?('n') ? true : false
  end
end
