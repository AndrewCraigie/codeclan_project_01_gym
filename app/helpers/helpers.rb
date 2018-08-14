require ('pry')


helpers do


  def number_or_nil(string)
    Integer(string || '')
  rescue ArgumentError
    nil
  end



end
