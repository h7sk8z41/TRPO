class Word

  def check_CS_ending(str)

    if str.size == 0
      return "String is empty"
    end
    if str[-2].eql? "C" and str[-1].eql?"S"
      return  2**str.size
    elsif  str[-2].eql? "c" and str[-1].eql?"s"
        return  2**str.size
    else return str.reverse
    end
  end
end