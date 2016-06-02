class TodoList
  attr_reader :tasks
  def initialize(user)
  	@todo_store = YAML::Store.new("./public/tasks.yml")
    @tasks = []
    @user = user
  end

  def add_task(task)
  	@tasks << task
  end

  def delete_task(task_id)
  	@tasks.delete_if {|task| task.id == task_id.to_i}
  end

  def find_task_by_id(task_id)
  	id = @tasks.index { |task| task.id == task_id.to_i }
  	id ? @tasks[id] : nil
  end

  def sort_by_created(direction)
  	sorted_tasks = @tasks.sort { | task1, task2 | (direction == "DESC") ? task2.created_at <=> task1.created_at : task1.created_at <=> task2.created_at}
  end

  def save
	  @todo_store.transaction do 
	      @todo_store[@user] = @tasks
	  end
	end

	def load_tasks
		@tasks = YAML.load_file('./public/tasks.yml')[@user]
    if @tasks.size != 0
      @tasks[@tasks.size - 1].update_id(@tasks[@tasks.size - 1].id + 1)
    end
	end
end