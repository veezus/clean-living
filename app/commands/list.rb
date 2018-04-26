class ListCommand < BaseCommand
  include Styles
  include ListRenderer

  def run
    interactor.buffer render.split "\n"
  end

  def tasks
    Task.all.order :due_at
  end
end
