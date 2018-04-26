class ListCommand < BaseCommand
  include Styles
  include ListRenderer

  def print_no_tasks_message
    interactor.buffer pastel.blue 'There are no tasks to list.'
  end

  def run
    print_no_tasks_message and return if tasks.none?

    render.split("\n").each do |row|
      interactor.buffer row
    end
  end

  def tasks
    Task.all.order :due_at
  end
end
