RSpec.describe NoKingdom do
	subject { described_class.new }

	describe '#inspect' do
		it 'returns the size of the emblem characters' do
			expect(subject.inspect).to eq 'NONE'
		end
	end
end