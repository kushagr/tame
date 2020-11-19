class SoutherosUniverse
	attr_reader :kingdoms, :messages

	SPACE_KINGDOM        = 'SPACE'
	SPACE_KINGDOM_EMBLEM = 'GORILLA'
	LAND_KINGDOM         = 'LAND'
	LAND_KINGDOM_EMBLEM  = 'PANDA'
	WATER_KINGDOM        = 'WATER'
	WATER_KINGDOM_EMBLEM = 'OCTOPUS'
	ICE_KINGDOM          = 'ICE'
	ICE_KINGDOM_EMBLEM   = 'MAMMOTH'
	AIR_KINGDOM          = 'AIR'
	AIR_KINGDOM_EMBLEM   = 'OWL'
	FIRE_KINGDOM         = 'FIRE'
	FIRE_KINGDOM_EMBLEM  = 'DRAGON'

	KINGDOM_EMBLEM_MAP = {
		SPACE_KINGDOM => SPACE_KINGDOM_EMBLEM,
		LAND_KINGDOM  => LAND_KINGDOM_EMBLEM,
		WATER_KINGDOM => WATER_KINGDOM_EMBLEM,
		ICE_KINGDOM   => ICE_KINGDOM_EMBLEM,
		AIR_KINGDOM   => AIR_KINGDOM_EMBLEM,
		FIRE_KINGDOM  => FIRE_KINGDOM_EMBLEM,
	}.freeze

	def self.kingdoms
		KINGDOM_EMBLEM_MAP.map { |name, emblem| Kingdom.new(name: name, emblem: emblem) }
	end

	def initialize kingdoms:, messages: []
		@kingdoms = kingdoms
		@messages = messages
		@ruler    = nil
	end

	def establish_ruler
		messages.each(&:try_to_win_allegiance)
	end

	def ruler
		ruler ||= kingdoms.find { |kingdom| kingdom.ruler? } || NoKingdom.new
	end

	def find kingdom_name:
		kingdoms.find { |kingdom| kingdom.name == kingdom_name }
	end

end