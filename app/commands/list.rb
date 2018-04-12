class ListCommand
  def initialize args, options=Commander::Command::Options.new
  end

  def run
    Task.all.each do |task|
      say "#{task.id} #{task.name}"
    end
  end
end
