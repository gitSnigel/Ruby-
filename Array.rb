# -*- coding: utf-8 -*-
class Array
  def select_all(argument = {})
    raise TypeError, "You have to have less args" unless argument.size <3
  collect = Array.new()
    if argument.size == 1
      if argument.values.first.class == Array
        self.each{
          |x|
          if argument.values.first.include?(x.send(argument.keys.first))
            collect << x
          end
        }
      else
        self.each{
          |x|
          if argument.values.first == x.send(argument.keys.first)
            collect << x
          end
      }
      end
   else
      min = argument.values.last.values.first
      max = argument.values.last.values.last
      self[min..max].each{
        |x|
          collect << x
      }
    end
    return collect
  end #select_all

  def select_first(args = {})
    raise TypeError, "You have to have less args" unless args.size < 3
    return  select_all(args)[0]
  end #select_first

end #Array

a = Array.new(["a", "aa", "Deeo", "odeo","hh","hello"])
puts "SIZE ******"
puts a.select_all(:size => 4)
puts a.select_all(:size => [4,2])
puts "INTERVAL ********"
puts a.select_all(:name => :attribute, :interval =>{:min => 2, :max => 4})
puts"TEST *****"
puts a.select_first(:size => 2)
