class ListCommand < BaseCommand
  include Styles
  include ListRenderer

  def run
    render.split("\n").each do |row|
      interactor.buffer row
    end
  end

  def tasks
    Task.all.order :due_at
  end
end
