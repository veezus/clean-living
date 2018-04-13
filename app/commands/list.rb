class ListCommand < BaseCommand
  include Styles

  attr_accessor :task

  def run
    Task.all.each do |task|
      self.task = task
      interactor.buffer "#{completed} #{id} #{task.name}"
    end
  end

  def completed
    task.completed? ? pastel.green('✔') : ' '
  end

  def id
    task.id.to_s.rjust tasks.last.id.to_s.length
  end

  def tasks
    Task.all
  end
end
