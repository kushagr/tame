class SeasarCipher < Cipher
	attr_reader :secret_key

	WHEEL = ('A'..'Z').to_a.freeze
	SPACE_CHARACTER = " "

	def initialize message:, secret_key:
		super message: message
		@secret_key = secret_key
	end

	def decrypt
		message.chars.map { |char| decryptor.fetch(char, SPACE_CHARACTER)  }.join
	end

	private

	def decryptor
		Hash[WHEEL.zip(WHEEL.rotate(-secret_key))]
	end
end