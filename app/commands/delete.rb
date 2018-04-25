class DeleteCommand < MultipleTaskCommand
  def delete_and_print_status
    tasks.map(&:destroy) and print_success_message
  end

  def run
    delete_and_print_status unless validation_failed?
  end
end
