class Messenger

	attr_reader :messages, :universe
	
	LIMIT_FOR_SPLITTING_MESSAGE = 2
	MESSAGE_DELIMITER = " "

	def initialize messages:, universe:
		@messages = messages
		@universe = universe
	end

	def deliver
		messages.each do |message|
			kingdom_name, content = parse_message message
			next if already_received_message? kingdom_name

			receiver_kingdom = universe.find(kingdom_name: kingdom_name)
			message = Message.new(sender: sender_kingdom, contents: content, receiver: receiver_kingdom)
			receiver_kingdom.message = message
			universe.messages << message
		end
	end

	private

	def already_received_message? kingdom_name
		universe.messages.any? { |message| message.receiver.name == kingdom_name }
	end

	def parse_message message
		message.split(MESSAGE_DELIMITER, LIMIT_FOR_SPLITTING_MESSAGE)
	end
	
	def sender_kingdom
		universe.find(kingdom_name: SoutherosUniverse::SPACE_KINGDOM)
	end
end