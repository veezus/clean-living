describe Task do
  let(:task) { Task.new }
  let(:testing_at) { Time.local 2018, 04, 11, 15, 15, 50 }

  it "validates presence of name and due_at" do
    expect(task).to_not be_valid
    expect(task.errors.messages[:name]).to include "can't be blank"
  end

  it "parses date strings" do
    task.chronic_due = 'friday at noon'
    Timecop.freeze(testing_at) do
      expect(task.due_at).to eq Time.local(2018, 04, 13, 12)
    end
  end

  describe "#complete!" do
    it "updates the completed_at" do
      Timecop.freeze(testing_at) do
        task = create :task
        expect(task.completed_at).to be nil

        task.completed!
        expect(task).to be_completed
        expect(task.completed_at).to be_within(1.second).of(Time.now)
      end
    end
  end
end
