describe Task do
  let(:task) { Task.new }

  it "validates presence of name" do
    expect(task).to_not be_valid
    expect(task.errors.messages[:name]).to include "can't be blank"
  end
end
