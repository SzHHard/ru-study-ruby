module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(films)
        pair_accumulated_film_rating__amount = films.reduce([0.0, 0]) do |acc, film|
          current_rating_kinopoisk = film['rating_kinopoisk']&.to_f
          number_of_countries = film['country']&.split(',')&.length || 0
          if current_rating_kinopoisk && current_rating_kinopoisk != 0 && number_of_countries >= 2
            [acc[0] + film['rating_kinopoisk'].to_f, acc[1] + 1]
          else
            acc
          end
        end
        pair_accumulated_film_rating__amount[0] / pair_accumulated_film_rating__amount[1]
      end

      def chars_count(films, threshold)
        letter_to_count = 'и'
        names_of_each_suitable_films = films.map do |film|
          rating_kinopoisk = film['rating_kinopoisk']&.to_f
          if rating_kinopoisk && rating_kinopoisk >= threshold
            film['name']
          else
            ''
          end
        end
        names_of_each_suitable_films.reduce(0) do |acc, name|
          acc + name.count(letter_to_count)
        end
      end
    end
  end
end
