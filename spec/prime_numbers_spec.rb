require './prime_numbers_multiplication_generator'

describe 'with invalid input data' do
  it 'raises error when letter is passed to count' do
    argv = ['--count', 'k']

    expect {
      PrimeNumbersMultiplicationGenerator.new(argv)
    }.to raise_exception ArgumentError
  end

  it 'raises error when non positive number is passed to count' do
    argv = ['--count', '-1']

    expect {
      PrimeNumbersMultiplicationGenerator.new(argv)
    }.to raise_exception ArgumentError
  end
end

describe 'with valid input data' do
  it 'prints' do
    expected = [
      "   | 2  3  5\n",
      "------------\n",
      " 2 | 4  6 10\n",
      " 3 | 6  9 15\n",
      " 5 |10 15 25\n"
    ].join('')

    generator = PrimeNumbersMultiplicationGenerator.new(['--count', '3'])
    generator.perform

    expect {
      generator.send(:printable_matrix)
    }.to eq expected
  end
end