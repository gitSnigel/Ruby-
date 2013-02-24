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
      puts argument
      min = argument.values.first.values.first
      max = argument.values.first.values.last
      self.each{
        |x|
        if  x.send(argument.values.last) >= min && x.send(argument.values.last) <= max
          collect << x
        end
      }
    end
    return collect
  end #select_all

  def select_first(args = {})
    raise TypeError, "You have to have less args" unless args.size < 3
    return  select_all(args)[0]
  end #select_first

  def method_missing(name, *args)
    if attribute = name.to_s.match(/^select_first_where_(.*)_is$/)
     puts "vad blir under "
       select_first(attribute[1].to_sym => args)
    elsif attribute = name.to_s.match(/^select_first_where_(.*)_is_in$/)
      puts "elsif"
      select_first(:name => attribute[1].to_sym, :interval => {:min => args[0], :max => args[1]})
    elsif  attribute = name.to_s.match(/^select_all_where_(.*)_is$/)
      select_all(attribute[1] => args)
    elsif attribute = name.to_s.match(/^select_all_where_(.*)_is_in$/)
      puts args[1]
      puts args[0]
      select_all(:name => attribute[1].to_sym, :interval => {:min => args[0], :max => args[1]})
    end

  end #method_missing

end #Array

a = Array.new(["a", "aa", "Deeo", "odeo","hh","hello"])
puts "SIZE ******"
puts a.select_all(:size => 4)
puts a.select_all(:size => [4,2])
puts "INTERVAL ********"
puts a.select_all(:name => :size, :interval =>{:min => 2, :max => 4})
puts"SELECT_FIRST *****"
puts a.select_first(:size => 2)
puts"METHOD_MISSING"
puts a.select_first_where_size_is(4)
puts a.select_first_where_size_is_in(2,4)
puts a.select_all_where_size_is(4)
puts a.select_all_where_size_is_in(2,4)
