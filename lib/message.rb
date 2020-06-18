class Message
  def welcome
    "\t\t\t-----WELCOME-----\n\nHere you can find the details of coronavirus COVID-19 cases of a country, territory, or conveyance.\n\nSearch by entering a COUNTRY NAME or POSITION or see the list for WHOLE WORLD.\n\n"
  end

  def enter_choice
    "Please enter\n\t1 for search by COUNTRY NAME.\n\t2 for search by POSITION.\n\t3 for list of WHOLE WORLD."
  end

  def enter_country_name
    'Please enter the country name you want to search: '
  end

  def enter_position
    'Please enter the position you want to find a country about [1-215]: '
  end

  def valid_position
    'Please enter between 1 and 215 only.'
  end

  def all_country
    'Showing the details about COVID-19 infections for all countries and territories in world:'
  end

  def continue
    'Do you want to continue? (Y/N): '
  end

  def thank
    "\n\n\t\t\t...THANK YOU..."
  end
end