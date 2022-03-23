require_relative 'code'

class Codebreaker
  attr_accessor :code, :attempts, :hints

  def initialize(difficult)
    @code = Code.new
    case difficult
    when 'easy'
      @attempts = 15
      @hints = 2
    when 'medium'
      @attempts = 10
      @hints = 1
    when 'hell'
      @attempts = 5
      @hints = 1
    end
    # p @code
  end

  def game
    result = ''
    while result != '++++' && @attempts > 0
      p "You have #{@attempts} attempts and #{@hints} hints"
      p "Put your guess or command"
      user_code = gets.chomp
      case user_code
      when /^[1-6]{4}$/
        result = compare(user_code)
      when 'hint'
        hint
      when 'exit'
        p "Code: #{@code.code.join('')}"
        break
      else
        p 'Print code or command correctly'
      end
    end
  end

  def compare(user_code)
    @attempts -= 1
    user_code = user_code.to_s.split(//).map { |item| item.to_i }
    result = @code.compare(user_code)
    if result == '++++'
      puts 'You win'
    else
      return answer if @attempts == 0
    end
    result
  end

  def hint
    if @hints > 0
      @code.hint
      @hints -= 1
    else
      p 'No hints left'
    end
  end

  def answer
    p 'Your attempts are left'
    p "Code: #{@code.code.join('')}"
  end
end