require "#{File.dirname(__FILE__)}/numeric_extensions.rb"
module Maths
  extend self

  def setup
    Numeric.send(:include, NumericExtensions)
  end

  def k_mult(x, y)
    puts "k_mult called with #{x.inspect} * #{y.inspect}"
    raise ArgumentError, "input lengths of #{x.inspect} and #{y.inspect} do not match" unless x.digit_count == y.digit_count
    return x * y if 1 == x.digit_count

    a, b = x.split
    c, d = y.split

    print "ac ="
    ac = k_mult(a,c) # 1
    puts "#{ac.inspect}"

    ad = k_mult(a,d) # 2a
    bc = k_mult(b,c) # 2b
    # or k_mult((a + b), (c + d)) # 2

    print "bd ="
    bd = k_mult(b,d) # 3
    puts "#{bd.inspect}"

    print "term1 ="
    term1 = ac.append_zeros(x.digit_count)
    puts "#{term1.inspect}"
    print "term2 ="
    term2 = (ad + bc).append_zeros(x.half_digit_count)
    puts "#{term2.inspect}"

    term1 + term2 + bd
  end
end
