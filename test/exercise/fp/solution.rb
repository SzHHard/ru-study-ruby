module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(films)
        suitable_films_number = 0
        accumulated_film_rating = films.reduce(0.0) do |sum, film|
          current_rating_kinopoisk = film['rating_kinopoisk']&.to_f
          number_of_countries = film['country']&.split(',')&.length || 0
          if current_rating_kinopoisk && current_rating_kinopoisk != 0 && number_of_countries >= 2
            suitable_films_number += 1
            sum + film['rating_kinopoisk'].to_f
          else
            sum
          end
        end
        accumulated_film_rating / suitable_films_number
      end

      def chars_count(films, threshold)
        letter_to_count = 'и'
        number_of_letters_per_each = films.map do |film|
          rating_kinopoisk = film['rating_kinopoisk']&.to_f
          if rating_kinopoisk && rating_kinopoisk >= threshold
            number_of_letters_to_count = film['name'].chars.reduce(0) do |acc, symbol|
              if symbol == letter_to_count
                acc + 1
              else
                acc
              end
            end
            number_of_letters_to_count
          else
            0
          end
        end
        number_of_letters_per_each.reduce(0) do |acc, number|
          acc + number
        end
      end
    end
  end
end
