class Code
	attr_accessor :code, :code_hint

	def initialize
		@code = []
		4.times { @code.push(rand(1..6)) }
		@code_hint = @code.dup
		# p @code
	end

	def compare(user_code)
		copy_code = @code.dup
		result = ''
		user_code.each_with_index do |user_number,index|
			if copy_code[index] == user_code[index]
				result << '+'
				copy_code[index] = nil
				user_code[index] = 0
			end
		end
		user_code.each_with_index do |user_number,index|
			number = copy_code.index(user_number)
			if number == nil
				next
			end
			if number != index
				result << '-'
				copy_code[number] = nil
			end
		end
		p result
	end

	def hint
		p @code_hint.delete_at(rand(@code_hint.size))
	end
end
