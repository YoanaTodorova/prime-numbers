class Matrix
  def initialize(header: [], border_width: 1, delimiter: '|')
    @header = header
    @border_width = border_width
    @column_width = (@header.last * @header.last).to_s.length
    @delimiter = delimiter

    @matrix = build_matrix
  end

  def printable_matrix
    [
      header,
      @matrix.map { |row| printable_row(row.drop(1), row.first) }
    ].flatten.join('')
  end

  private

  def build_matrix
    @matrix = @header.map.with_index do |element, index|
      [element, *@header.map { |el| el * element }]
    end
  end

  def header
    row_size = (@header.size + 1) * (@column_width + @border_width)

    [
      printable_row(@header),
      '-' * row_size,
      "\n"
    ]
  end

  def printable_row(row, lead_element = ' ')
    [
      lead_colummn_element(lead_element),
      *row.map { |element| format(element) },
      "\n"
    ]
  end

  def lead_colummn_element(element)
    [
      format(element),
      @delimiter
    ]
  end

  def format(element)
    element.to_s.rjust(@column_width, ' ') + ' '.center(@border_width, ' ')
  end
end