module Exercise
  module Arrays
    class << self
      def replace(array)
        max = array[0]
        for el in array
          max = el if el > max
        end
        array.map do |el|
          if el > 0
            max
          else
            el
          end
        end
      end

      def search(array, query, left = 0, right = array.length - 1)
        return -1 if left > right

        middle = left + ((right - left) / 2)
        return middle if array[middle] == query
        
        if array[middle] > query
          search(array, query, left, middle - 1)
        else
          search(array, query, middle + 1, right)
        end
      end
    end
  end
end
