class Matrix
  def initialize(header: [], border_width: 1, delimiter: '|')
    @header = header
    @border_width = border_width
    @column_width = (@header.last * @header.last).to_s.length
    @delimiter = delimiter

    @matrix = build_matrix
  end

  def print_matrix
    print_header

    @matrix.each do |row|
      print_lead_colummn_element(row.first)
      print_row(row.drop(1))
    end
  end

  private

  def build_matrix
    @matrix = @header.map.with_index do |element, index|
      [element, *@header.map { |el| el * element }]
    end
  end

  def print_header
    print format(' '), @delimiter, *@header.map { |el| format(el) }, "\n"
    print '-' * (@header.size + 1) * (@column_width + @border_width), "\n"
  end

  def print_row(row)
    print *row.map { |element| format(element) }, "\n"
  end

  def print_lead_colummn_element(element)
    print format(element), @delimiter
  end

  def format(element)
    element.to_s.rjust(@column_width, ' ') + ' '.center(@border_width, ' ')
  end
end