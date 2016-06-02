require './task.rb'
require 'date'
require 'yaml/store'
require './modules.rb'


class TodoList
    include File_manageable
    attr_reader :tasks, :user
    def initialize(user)
        @tasks = []
        @user = user
        @todo_store = YAML::Store.new("./tasks_#{@user}.yml")
    end

    def add_task(task)
      @tasks.push(task)
    end

    def delete_task(id)
      index = @tasks.find_index { |item| item.id == id }
      @tasks.delete_at(index)
    end

    def find_task_by_id(id)
      task = @tasks.find{|item| item.id == id}
      task != nil ? task : nil
    end

    def sort_by_created(order)
      case order.upcase
      when 'ASC'
        sorted_tasks = @tasks.sort { | task1, task2 | task1.created_at <=> task2.created_at }
      when 'DESC'
        sorted_tasks = @tasks.sort { | task1, task2 | task2.created_at <=> task1.created_at }
      end
      sorted_tasks.each {|task| puts "#{task.id}. #{task.content}: #{task.created_at}"}
    end
end


todo_list = TodoList.new("Josh")
task = Task.new("Walk the dog")
task2 = Task.new("Buy the milk")
task3 = Task.new("Make my todo list into a web app")
todo_list.add_task(task)
todo_list.add_task(task2)
todo_list.add_task(task3)
todo_list.save
todo_list.load_file
puts todo_list.tasks.length
