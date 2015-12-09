class PrimeNumbersMultiplicationGenerator
  def initialize(arguments)
    @arguments = Hash[*arguments]

    @count = parse_argument(:count)
  end

  def perform
    @primes = prime_numbers.first(@count)

    @matrix = @primes.map do |row_number|
      @primes.map do |column_number|
        row_number * column_number
      end
    end
  end

  def print_matrix
    column_width = @matrix.last.last.to_s.length
    border = 1

    print ''.rjust(column_width + border, ' '), '|'
    @primes.each { |number| print number.to_s.rjust(column_width + border, ' ') }
    puts
    print '-'.center((@primes.size + 1)*(column_width + border), '-')
    puts

    @matrix.each_with_index do |row, index|
      print @primes[index].to_s.rjust(column_width + border, ' '), '|'
      row.each { |number| print number.to_s.rjust(column_width + border, ' ') }
      puts
    end
  end

  private

  def prime_numbers
    enumerator = Enumerator.new do |yielder|
      number = 2
      loop do
        yielder << number if prime?(number)
        number += 1
      end
    end
  end

  def parse_argument(key)
    value = @arguments["--#{key}"]

    case key
    when :count then value.to_i
    end
  end

  def prime?(number)
    return false if number < 2
    (2..Math.sqrt(number)).all? { |divisor| number % divisor != 0 }
  end
end