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
        my_reduce(self.class.new([])) { |acc, current| acc << (yield current) }
      end

      # Написать свою функцию my_compact
      def my_compact
        my_reduce(self.class.new([])) { |acc, current| current.nil? ? acc : acc << current }
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
