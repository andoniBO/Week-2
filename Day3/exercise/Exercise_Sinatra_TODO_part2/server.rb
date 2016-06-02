# server.rb
require 'sinatra'
require 'sinatra/reloader' if development? 

require_relative './models/todoList.rb'
require_relative './models/task.rb'
require 'yaml/store'
require 'pry'

#set :haml, :format => :html5

todo_list = TodoList.new("Pepe")
todo_list.load_tasks

get '/tasks' do
	@tasks = todo_list.tasks
	haml(:task_index)
end

get '/new_task' do
	haml(:new_task)
end

post '/create_task' do
	todo_list.add_task(Task.new(params[:content]))
	todo_list.save
	redirect to(:tasks)
end

get '/complete/:id' do
	task = todo_list.find_task_by_id(params[:id])
	task.complete!
	todo_list.save
	redirect to(:tasks)
end

post '/delete_task' do
	todo_list.delete_task(params[:id])
	todo_list.save
	redirect to(:tasks)
end

