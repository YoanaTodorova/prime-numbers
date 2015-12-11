require './prime_numbers_sequence'
require './arguments_validator'
require './matrix'

class PrimeNumbersMultiplicationGenerator
  include ArgumentsValidator

  def initialize(arguments)
    permit keys: ['count'], from: arguments

    @primes = PrimeNumbersSequence.first(@count)
    @matrix = Matrix.new(header: @primes)
  end

  def print_matrix
    print printable_matrix
  end

  private

  def printable_matrix
    @matrix.printable_matrix
  end
end