require 'forwardable'

class Message
	extend Forwardable

	attr_reader :sender, :receiver, :contents

	def_delegators :receiver, :secret_key

	MINIMUM_FREQUENCY_COUNT = 1

	def initialize sender:, receiver:, contents:
		@sender    = sender
		@receiver  = receiver
		@contents  = contents
	end

	def decrypted
		receiver.decrypted_message
	end

	def try_to_win_allegiance
		sender.allies << receiver if wins_receiver?
	end

	private

	def wins_receiver?
		decrypted_frequency = calculate_frequencies(decrypted)

		calculate_frequencies(receiver.emblem).all? do |character, frequency|
			(MINIMUM_FREQUENCY_COUNT..decrypted_frequency[character]).cover? frequency
		end
	end

	def calculate_frequencies(string)
		string.each_char.with_object(Hash.new(0)) do |letter, frequency|
			frequency[letter] += 1
		end
	end
end