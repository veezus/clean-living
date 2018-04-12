class ErrorFormatter
  def self.console errors
    errors.full_messages.map do |field_with_message|
      "  * #{field_with_message}"
    end.join("\n")
  end
end
