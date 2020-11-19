RSpec.describe SoutherosUniverse do
	subject { described_class.new kingdoms: SoutherosUniverse.kingdoms }

	describe '#new' do
		it "initializes kingdoms" do
			expect(subject.kingdoms.map(&:name)).to match_array SoutherosUniverse.kingdoms.map(&:name)
		end

		it "initializes messages" do
			expect(subject.messages).to eq []
		end
	end

	describe '#establish_ruler' do
		let(:message) { double(:message, try_to_win_allegiance: true) }
	
		before do
			subject.messages << message
		end

		it 'calls wins_allegiance on all messages' do
			subject.establish_ruler
			expect(message).to have_received(:try_to_win_allegiance)
		end
	end

	describe '#ruler' do
		context 'when no ruler' do
			it 'returns no ruler' do
				expect(subject.ruler).to be_a(NoKingdom)
			end
		end

		context 'when has a ruler' do
			before do
				allow(subject.kingdoms.first).to receive(:ruler?) { true }
			end

			it 'returns the kingdom' do
				expect(subject.ruler.name).to eq 'SPACE'
			end
		end
	end

	describe '#find' do
		context 'when kingdom found' do
			it 'returns kingdom' do
				expect(subject.find(kingdom_name: 'SPACE')).to eq subject.kingdoms.first
			end
		end
		
		context 'when kingdom not found' do
			it 'returns kingdom' do
				expect(subject.find(kingdom_name: 'NONE')).to eq nil
			end
		end

	end
end