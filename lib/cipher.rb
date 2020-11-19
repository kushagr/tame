class Cipher
	attr_reader :message

	def initialize message:
		@message = message
	end

	def decrypt
		raise NotImplementedError
	end
end