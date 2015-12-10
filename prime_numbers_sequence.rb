module PrimeNumbersSequence
  class << self
    include Enumerable

    private

    def each(&block)
      number = 2
      loop do
        block.call(number) if prime?(number)
        number += 1
      end
    end

    def prime?(number)
      return false if number < 2
      (2..Math.sqrt(number)).all? { |divisor| number % divisor != 0 }
    end
  end
end