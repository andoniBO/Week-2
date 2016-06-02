require File.expand_path '../spec_helper.rb', __FILE__

RSpec.describe TodoList do 
  before :each do
    @todo_list = TodoList.new("Mikel")
    @task = Task.new("Buy the milk")
    @task2 = Task.new("Buy the milk2")
  end

  describe "#add_task" do
    it "takes a parameter of a task, and adds it to our list of tasks" do
      @todo_list.add_task(@task)
      expect(@todo_list.tasks).to eq([@task])
    end
  end

  describe "#delete_task" do
    it "delete a Task by its ID" do
      @todo_list.add_task(@task)
      @todo_list.add_task(@task2)
      @todo_list.delete_task(@task.id)
      expect(@todo_list.tasks).to eq([@task2])
    end
  end

  describe "#find_task_by_id" do
    it "find a specific task by ID" do
      @todo_list.add_task(@task)
      @todo_list.add_task(@task2)
      expect(@todo_list.find_task_by_id(@task.id)).to eq(@task)
    end
  end

  describe "#sort_by_created" do
    it "should take @tasks from your todolist, sort it by it's date, and return a new array of sorted tasks ASC" do
      @todo_list.add_task(@task2)
      @todo_list.add_task(@task)
      expect(@todo_list.sort_by_created("ASC")).to eq([@task, @task2])
    end
  end

  describe "#sort_by_created" do
    it "should take @tasks from your todolist, sort it by it's date, and return a new array of sorted tasks DESC" do
      @todo_list.add_task(@task2)
      @todo_list.add_task(@task)
      expect(@todo_list.sort_by_created("DESC")).to eq([@task2, @task])
    end
  end
end