RSpec.describe Message do 
	subject { described_class.new(sender: sender, receiver: receiver, contents: contents) }

	let(:sender) { Kingdom.new name: 'SPACE', emblem: 'GORILLA' }
	let(:receiver) { Kingdom.new name: 'AIR', emblem: 'OWL' }
	let(:contents) { 'ROZO' }

	before do
		receiver.message = subject
	end
	
	describe '#new' do
		it 'initializes sender' do
			expect(subject.sender).to eq sender
		end

		it 'initializes receiver' do
			expect(subject.receiver).to eq receiver
		end

		it 'initializes contents' do
			expect(subject.contents).to eq contents
		end
	end

	describe '#decrypted' do
		it 'returns the decrypted message' do
			expect(subject.decrypted).to eq 'OLWL'
		end
	end

	describe 'try_to_win_allegiance' do
		it 'adds ally to message sender if message is satisfactory' do
			expect { subject.try_to_win_allegiance }.to change { subject.sender.allies }.from([]).to([receiver])
		end

		context 'when character count is more than one' do
			let(:receiver) { Kingdom.new name: 'LAND', emblem: 'PANDA' }
			let(:contents) { 'FAIJWJSOOFAMAU' }

			it 'adds ally to message sender if message is satisfactory' do
				expect { subject.try_to_win_allegiance }.to change { subject.sender.allies }.from([]).to([receiver])
			end
		end
		
	end
		
end