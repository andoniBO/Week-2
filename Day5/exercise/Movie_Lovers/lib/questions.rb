class Questions
  attr_reader :question_array

  def initialize
    @question_array = Array.new
    @id = 0
  end

  def add_question(new_question, new_answer)
    question = {question: new_question, answer: new_answer, id: @id}
    @question_array.push(question)
    @id += 1
  end
end