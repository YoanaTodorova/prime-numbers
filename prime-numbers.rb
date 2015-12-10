require './prime_numbers_multiplication_generator'

if ARGV.size != 2
  raise ArgumentError, 'no arguments passed'
else
  generator = PrimeNumbersMultiplicationGenerator.new(ARGV)

  generator.perform
  generator.print_matrix
end