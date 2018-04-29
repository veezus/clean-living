describe NewCommand do
  let(:interactor) do
    InteractorCommand.new.tap do |interactor|
      interactor.command = 'new'
      interactor.arguments = %w(Take out the papers and the trash, today, chores weekly-template)
    end
  end
  let(:command) { NewCommand.new interactor }
  let(:testing_at) { Time.local 2018, 04, 11, 15, 15, 50 }

  describe "#initialize" do
    it "builds a task with the specified name" do
      Timecop.freeze(testing_at) do
        expect(command.task.name).to eq 'Take out the papers and the trash'
        expect(command.task.due_at.to_date).to eq Date.today
        expect(command.task.tags).to eq %w(chores weekly-template)
      end
    end
  end
end
