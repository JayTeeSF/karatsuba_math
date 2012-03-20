module NumericExtensions
  def coefficient_of_first_half
     (10 ** half_digit_count)
  end

  def split
    (Float(self) / coefficient_of_first_half).to_s.split(".").map(&:to_i)
  end

  def append_zeros(num=0)
    (self.to_s + ('0' * num)).to_i
  end

  def half_digit_count
    (Float(digit_count) / 2).ceil
  end

  def digit_count
    self.to_s.size
  end
end
