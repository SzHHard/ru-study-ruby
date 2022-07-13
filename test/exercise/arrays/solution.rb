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

      def search(_array, _query, left = 0, right = _array.length - 1)
        return -1 if left > right
        current_index = left + ((right - left) / 2)
        if _array[current_index] == _query
          current_index
        elsif _array[current_index] > _query
          search(_array, _query, left, current_index - 1)
        else
          search(_array, _query, current_index + 1, right)
        end
      end
    end
  end
end
