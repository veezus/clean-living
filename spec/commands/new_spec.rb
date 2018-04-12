describe NewCommand do
  let(:command) { NewCommand.new(['Take out the papers and the trash']) }

  describe "#initialize" do
    it "builds a task with the specified name" do
      expect(command.task.name).to eq 'Take out the papers and the trash'
    end
  end

  describe "#print_error_messages" do
    it "prints messages with the `say` command" do
      allow(ErrorFormatter).to receive(:console).and_return "  * an error"
      expect(HighLine).to receive(:color).with \
        "There was an error saving that task:\n  * an error", :red

      command.print_error_messages
    end
  end
end
