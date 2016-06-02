require 'time'

class Task
    attr_reader :content, :id, :completed, :created_at, :updated_at
    @@current_id = 1
    #@@year = 1000
    def initialize(content)
        @content = content
        @id = @@current_id
        @@current_id += 1
        @completed = false
        @created_at = Time.now
        @updated_at = nil
        # This variables are just for testing purposes on ordering the tasks
        # @created_at = Time.new(@@year)
        # @@year += 1
    end

    def complete?
      @completed
    end

    def complete!
      @completed = true
    end

    def make_incomplete!
      @completed = false
    end

    def update_content!(new_content)
      @updated_at = Time.now
      @content = new_content
    end
end

# task = Task.new("Buy the milk")
# puts task.id
# # 1
# task2 = Task.new("Wash the car")
# puts task2.id
# # 2


