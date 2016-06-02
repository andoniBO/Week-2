require_relative 'todolist.rb'
require './task.rb'
require 'pry'

RSpec.describe TodoList do
  let(:todo){TodoList.new("Josh")}
  let(:task){Task.new("Example Task")}
  let(:add_task){todo.add_task(task)}

  it "checks the task is correctly added" do
    actual_length = todo.tasks.length
    add_task
    expect(todo.tasks.length).to eq(actual_length + 1)
  end

  it "should delete a task by its ID" do
    add_task
    expect(todo.delete_task(task.id)).to eq(task)
  end

  it "should find a task by its ID" do
    add_task
    expect(todo.find_task_by_id(task.id)).to eq(task)
  end

  it "should return nil if no task is found" do
    add_task
    expect(todo.find_task_by_id(todo.tasks.length)).to eq(nil)
  end

  it "will show us if the array is sorted" do
    add_task
    add_task
    add_task
    add_task
    sorted_tasks = todo.tasks.sort { | task1, task2 | task1.created_at <=> task2.created_at }
    expect(todo.sort_by_created('ASC')).to eq(sorted_tasks)
  end

  it "will show us if the array is sorted in DESCENDANT ORDER" do
    add_task
    add_task
    add_task
    add_task
    sorted_tasks = todo.tasks.sort { | task1, task2 | task2.created_at <=> task1.created_at }
    expect(todo.sort_by_created('DESC')).to eq(sorted_tasks)
  end

  it "will make sure attr user exists" do
    expect(todo.user).to_not be_nil
  end

  it "checks if it creates a file when saving" do
    add_task
    add_task
    add_task
    todo.save
    expect(File.exist?("tasks_Josh.yml")).to eq true
  end

  it "Loads a file with the saved tasks" do
    file = todo.load_file
    expect(file).to_not be_nil
  end

end
