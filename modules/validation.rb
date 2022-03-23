module Validation
  def validate_difficult(difficult)
    return true if difficult == 'easy'
    return true if difficult == 'medium'
    return true if difficult == 'hell'
    p 'easy - 15 attempts and 2 hints'
    p 'medium - 10 attempts and 1 hint'
    p 'hell - 5 attempts and 1 hint'
    false
  end
end