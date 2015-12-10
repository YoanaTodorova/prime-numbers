module ArgumentsValidator
  def permit_arguments(arguments, accepted_arguments_list)
    arguments = Hash[*arguments]
    @permitted_arguments = arguments.select { |k, _| accepted_arguments_list.include? k.gsub(/^-+/, '').to_sym }
    @permitted_arguments = @permitted_arguments.map { |key, value| [key.gsub(/^-+/, '').to_sym, value] }.to_h

    @permitted_arguments.keys.each { |arg| public_send("set_#{arg}") }
  end

  def set_count
    @count = @permitted_arguments[:count].to_f if valid_count?
  end

  def valid_count?
    return true if @permitted_arguments[:count].to_i > 0
    raise ArgumentError, 'Value of count should evaluate to non zero number'
  end
end