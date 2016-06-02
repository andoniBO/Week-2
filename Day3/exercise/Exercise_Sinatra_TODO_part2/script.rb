require_relative "todoList.rb"
require_relative "task.rb"

require 'yaml/store'
require 'pry'

todo_list = TodoList.new("Josh")
todo_list.add_task(Task.new("Walk the dog"))
todo_list.add_task(Task.new("Buy the milk"))
todo_list.add_task(Task.new("Make my todo list into a web app"))
todo_list.save

todo_list2 = TodoList.new("Josh")
puts todo_list2.tasks.length
todo_list2.load_tasks
puts todo_list2.tasks.length