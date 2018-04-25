class MultipleTaskCommand < BaseCommand
  attr_accessor :ids, :tasks

  def initialize interactor
    super
    self.ids = interactor.arguments
    self.tasks = Task.where id: ids
  end

  def please_provide_an_id
    message = "Please provide one or more task ids"
    interactor.error message
  end

  def could_not_find_tasks
    message = "Couldn't find any tasks"
    interactor.error message
  end

  def validation_failed?
    please_provide_an_id and return true if ids.none?
    could_not_find_tasks and return true if tasks.none?
  end
end
