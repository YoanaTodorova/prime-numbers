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
      print_row(row.drop(1), row.first)
    end
  end

  private

  def build_matrix
    @matrix = @header.map.with_index do |element, index|
      [element, *@header.map { |el| el * element }]
    end
  end

  def print_header
    print_row(@header)

    row_size = (@header.size + 1) * (@column_width + @border_width)
    print '-' * row_size, "\n"
  end

  def print_row(row, lead_element = ' ')
    print_lead_colummn_element(lead_element)
    print *row.map { |element| format(element) }, "\n"
  end

  def print_lead_colummn_element(element)
    print format(element), @delimiter
  end

  def format(element)
    element.to_s.rjust(@column_width, ' ') + ' '.center(@border_width, ' ')
  end
end