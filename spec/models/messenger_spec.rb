RSpec.describe Messenger do
	subject { described_class.new messages: messages, universe: universe }

	let(:messages) { ["AIR ROZO"] }
	let(:universe) { SoutherosUniverse.new kingdoms: SoutherosUniverse.kingdoms }

	describe '#new' do
		it 'initializes messages' do
			expect(subject.messages).to eq messages
		end

		it 'initializes universe' do
			expect(subject.universe).to eq universe
		end
	end

	describe '#deliver' do
		before do
			subject.deliver
		end

		let(:air_kingdom) { universe.find(kingdom_name: 'AIR') }
		
		it 'adds the message received by the receiving kingdom' do
			expect(air_kingdom.message.contents).to eq 'ROZO'
		end

		it 'adds the message to the universe' do
			expect(universe.messages.first.contents).to eq 'ROZO'
		end

	end
end