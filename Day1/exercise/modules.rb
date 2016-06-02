module File_manageable
  def save
    @todo_store.transaction do
      @todo_store[@user] = @tasks
    end
  end

  def load_file
    file = YAML::load( File.open("./tasks_#{@user}.yml") )
  end
end
