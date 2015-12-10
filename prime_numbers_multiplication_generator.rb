require './prime_numbers_sequence'
require './arguments_validator'
require './matrix'

class PrimeNumbersMultiplicationGenerator
  include ArgumentsValidator

  def initialize(arguments)
    permit_arguments(arguments, [:count])

    @primes = PrimeNumbersSequence.first(@count)
  end

  def perform
    @matrix = @primes.map do |row_number|
      @primes.map do |column_number|
        row_number * column_number
      end
    end
  end

  def print_matrix
    Matrix.new(header: @primes).print_matrix
  end
end