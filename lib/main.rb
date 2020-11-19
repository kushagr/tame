require_relative 'southeros_universe'
require_relative 'messenger'
require_relative 'kingdom'
require_relative 'no_kingdom'
require_relative 'message'
require_relative 'cipher'
require_relative 'seasar_cipher'
require_relative 'plain_text_cipher'

def main(input_file_path) 
	begin
		kingdom_with_their_messages = File.open(input_file_path).read.split("\n")
	rescue TypeError
		puts "Please provide a path to input file"
	else
		universe  = SoutherosUniverse.new kingdoms: SoutherosUniverse.kingdoms
		messenger = Messenger.new(messages: kingdom_with_their_messages, universe: universe)

		messenger.deliver
		universe.establish_ruler
		puts universe.ruler.inspect
	end
end