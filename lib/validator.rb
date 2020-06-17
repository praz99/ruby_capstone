class Validator
  def choice_valid?(choice)
    choice.between?('1', '3') ? true : false
  end

end
