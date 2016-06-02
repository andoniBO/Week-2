require File.expand_path '../spec_helper.rb', __FILE__

RSpec.describe Task do 
  before :each do
    @task = Task.new("Buy the milk")
  end

  describe "#complete?" do
    it "return the task is complete or not" do
      expect(@task.completed?).to eq(false)
    end
  end

  describe "#complete!" do
    it "change the task complete to true" do
      expect(@task.complete!).to eq(true)
    end
  end

  describe "#make_incomplete!" do
    it "takes a complete task and makes it's completed status false" do
      expect(@task.make_incomplete!).to eq(false)
    end
  end

  describe "#update_content!" do
    it "update the task's text" do
      @task.update_content!("Walk the dog")
      expect(@task.content).to eq("Walk the dog")
    end
  end
end