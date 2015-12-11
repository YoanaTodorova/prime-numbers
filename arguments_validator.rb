module ArgumentsValidator
  def permit(keys: [], from: [])
    permitted_arguments = normalize_keys(from)
      .select { |key, _| keys.include? key }

    permitted_arguments.each { |key, value| public_send("set_#{key}", value) }
  end

  def set_count(value)
    @count = value.to_f if valid_count?(value)
  end

  def valid_count?(value)
    return true if value.to_i > 0
    raise ArgumentError, 'Value of count should evaluate to non zero number'
  end

  def normalize_keys(arguments)
    Hash[*arguments].map { |key, value| [key.gsub(/^-+/, ''), value] }.to_h
  end
end