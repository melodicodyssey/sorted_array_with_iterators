class SortedArray
  attr_reader :internal_arr

  def internal_arr
      return @internal_arr
    end

  def initialize arr=[]
    @internal_arr = []
    arr.each { |el| add el }
  end

  def add el
    # we are going to keep this array
    # sorted at all times. so this is ez
    lo = 0
    hi = @internal_arr.size
    # note that when the array just
    # starts out, it's zero size, so
    # we don't do anything in the while
    # otherwise this loop determines
    # the position in the array, *before*
    # which to insert our element
    while lo < hi
      # let's get the midpoint
      mid = (lo + hi) / 2
      if @internal_arr[mid] < el
        # if the middle element is less 
        # than the current element
        # let's increment the lo by one
        # from the current midway point
        lo = mid + 1
      else
        # otherwise the hi *is* the midway 
        # point, we'll take the left side next
        hi = mid 
      end
    end

    # insert at the lo position
    @internal_arr.insert(lo, el)
  end

  def each &block
    # raise NotImplementedError.new("You need to implement the each method!")
    i = 0
    while i < @internal_arr.length
      yield @internal_arr[i]
      i += 1
    end
    @internal_arr
  end

  def map &block
    # raise NotImplementedError.new("You need to implement the map method!")
    new_array = []
    each {|element| new_array << (yield element) }
    new_array

    # new_array = []
    # i = 0
    # while i < @internal_arr.length
    #   new_array << (yield @internal_arr[i])
    #   i += 1
    # end
    # new_array
  end

  def map! &block
    # raise NotImplementedError.new("You need to implement the map! method!")
  
    new_array = []
    each {|element| new_array << (yield element)}
    @internal_arr = new_array


  # new_array
  # i = 0
  # while i < @internal_arr.length
  #   new_array << (yield @internal_arr[i])
  #   i+=1
  # end
  # @internal_arr = new_array
  # @internal_arr
  end

  def find &value
    # raise NotImplementedError.new("You need to implement the find method!")
      # i = 0
      # while i < @internal_arr.length
      #   if @internal_arr[i] == (yield value)
      #     return value
      #   end
      #   i += 1
      # end
      # return 
      each do |element| 
        if yield element
          return element
        end
      end
      return nil
  end

  def inject acc=nil, &block
    # raise NotImplementedError.new("You need to implement the inject method!")
    # inject takes and argument and a block
    # inject(arg=0){block to run on each element}


    # run block on each element of @internal_arr, update acc
    # each do |element|
    #   yield acc
    #   acc = yield element
    # end

    if acc.class == Symbol
      method = acc.to_proc
      acc = 0

      each do |element|
        acc = method(acc,element)
      end


    # # elsif block = nil && acc != nil
    # #   method = acc.to_sym.to_proc
    # #   acc = 0
    # #   each do |element|
    # #     acc = method(element)
    # #   end
      return acc
    end

    acc == nil ? acc = 0 : acc = acc
    
    each do |element|
      # block.call(acc, element)
      acc = (yield acc, element)
    end

    return acc


  end
end

# ex1 = SortedArray.new([1,2,3,4,5])
# puts ex1.inject(:+)

# [1,2,3,4,5]   

#   acc = 0
# each do |sum,element| sum + element
#   acc = {|0,1| 0 + 1} => 1
#   acc = {|1,2| 1 + 2} => 3
#   acc = {|3,3| 3 + 3} => 6
#   acc = {|6,4| 6 + 4} => 10
#   acc = {|10,5| 10 + 5} => 15

#   acc = 15
#   return acc

=begin
  
  each do (:+)
  
=end