module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each
        for i in self
          yield i
        end
      end

      # Написать свою функцию my_map
      def my_map
        modified_array = self.class.new(self)
        for i in (0...length)
          modified_array[i] = yield self[i]
        end
        modified_array
      end

      # Написать свою функцию my_compact
      def my_compact
        new_arr = self.class.new([])
        my_each { |el| !el.nil? && new_arr.push(el) }
        new_arr
      end

      # Написать свою функцию my_reduce
      def my_reduce(initial = nil)
        acc = initial
        for i in self
          if acc.nil?
            acc = i
            next
          end
          acc = yield(acc, i)
        end
        acc
      end
    end
  end
end
