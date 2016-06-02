class Task
    attr_reader :content, :id, :created_at
    attr_accessor :current_id

    @@current_id = 1
    def initialize(content)
        @content = content
        @id = @@current_id
        @@current_id += 1
        @complete = false
        @created_at = Time.now
        @updated_at = nil
    end

    def completed?
    	@complete
    end

    def complete!
    	@updated_at = Time.now
    	@complete = true
    end

    def make_incomplete!
    	@updated_at = Time.now
    	@complete = false
    end

    def update_content!(content)
    	@content = content
    end

    def update_id(last_id)
        @@current_id = last_id
    end
end