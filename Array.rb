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
            break
          end
        }
      else
        self.each{
          |x|
          if argument.values.first == x.send(argument.keys.first)
            collect << x
             break
          end
      }
      end
   else
      min = argument.values.last.values.first
      max = argument.values.last.values.last
      self[min..max].each{
        |x|
      #  if x.send(arguments.keys.first) <= max && x.size >= min
          collect << x
       # end
      }
    end
    puts collect
    return collect
  end

  def select_first(args = {})
    raise TypeError, "You have to have less args" unless args.size < 3
    select_all(args)[0]
  end
end

a = Array.new(["a", "aa", "Deeo", "odeo","h","hello"])
puts "SIZE ******"
a.select_all(:size => 4)
a.select_all(:size => [4,2])
puts "INTERVAL ********"
a.select_all(:name => :attribute, :interval =>{:min => 2, :max => 4})
puts"TEST *****"
a.select_first(:size => 2)
