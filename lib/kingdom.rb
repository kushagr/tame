class Kingdom
	attr_reader :name, :emblem, :message, :allies
	attr_writer :message
	ALLIES_NAME_DELIMITER = " "

	MINIMUM_NUMBER_OF_ALLIES_TO_BE_RULER = 2

  def initialize name:, emblem:, message: nil, allies: []
  	@name     = name
  	@emblem   = emblem
  	@message  = message
  	@allies   = allies
	end

	def secret_key
		emblem.size
	end

	def emblem_characters
		emblem.chars
	end

	def ruler?
		allies.size > MINIMUM_NUMBER_OF_ALLIES_TO_BE_RULER
	end

	def inspect
		"#{name} #{allies_names}".strip
	end

	def decrypted_message decryptor: SeasarCipher.new(message: message.contents, secret_key: secret_key)
		@decrypted_message ||= decryptor.decrypt
	end

	private

	def allies_names
		allies.map(&:name).join(ALLIES_NAME_DELIMITER)
	end
end