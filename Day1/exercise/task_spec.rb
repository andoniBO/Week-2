require_relative 'task.rb'
require 'date'

RSpec.describe Task do

  let(:task){Task.new("todo 1")}

  it "attribute completed is false by default" do
    expect(task.completed).to eq false
  end

  it "complete? returns wether a task is done or not" do
    expect(task.complete?).to eq false
  end

  it " complete! should mark a task as completed" do
    expect(task.complete!).to eq true
  end

  it "make_incomplete! should mark a task as incomplete" do
    expect(task.make_incomplete!).to eq false
  end

  it "should have a date of creation attribute" do
    expect(task.created_at).to eq(Date.today)
  end

  it "should change task to the one we want" do
    new_task = "cook my dinner"
    expect(task.update_content!(new_task)).to eq(new_task)
  end

  it "should have an attribute initialized to nil" do
    expect(task.updated_at).to eq(nil)
  end

  it "should timestamp a task update with current time when content update" do
    @task = Task.new("Something to do")
    @task.update_content!("Something new to do")
    expect(@task.updated_at).to eq(Date.today)
  end
end
