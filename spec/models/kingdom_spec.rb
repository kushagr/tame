RSpec.describe Kingdom do
	subject { described_class.new name: 'name', emblem: 'emblem' }
	
	describe '#new' do
		it 'initializes name' do
			expect(subject.name).to eq 'name'
		end

		it 'initializes emblem' do
			expect(subject.emblem).to eq 'emblem'
		end

		it 'initializes message' do
			expect(subject.message).to eq nil
		end

		it 'initializes allies' do
			expect(subject.allies).to eq []
		end
	end

	describe '#secret_key' do
		it 'returns the size of the emblem characters' do
			expect(subject.secret_key).to eq 6
		end
	end

	describe '#emblem_characters' do
		it 'returns emblem characters' do
			expect(subject.emblem_characters).to eq ['e', 'm', 'b', 'l', 'e', 'm']
		end
	end

	describe '#decrypted_message' do
		let(:message) { Message.new(sender: sender, receiver: receiver, contents: 'ROZO') }
		let(:sender) { Kingdom.new name: 'SPACE', emblem: 'GORILLA' }
		let(:receiver) { Kingdom.new name: 'AIR', emblem: 'OWL' }

		before do
			receiver.message = message
		end

		it 'returns the decrypted message' do
			expect(receiver.decrypted_message).to eq 'OLWL'
		end
	end

	describe 'ruler?' do
		context 'when the number of allies is greater than 2' do 
			subject { described_class.new name: 'name' , emblem: 'emblem', allies: [ally, other_ally, another_ally] }

			let(:ally) { described_class.new(name: 'ally', emblem: 'emblem') }
			let(:other_ally) { described_class.new(name: 'ally', emblem: 'emblem') }
			let(:another_ally) { described_class.new(name: 'ally', emblem: 'emblem') }

			it 'returns true' do
				expect(subject.ruler?).to eq true
			end
		end

		context 'when the number of allies is less than 2' do 
			subject { described_class.new name: 'name' , emblem: 'emblem' }

			it 'returns false' do
				expect(subject.ruler?).to eq false
			end
		end
	end

	describe '#inspect' do
		context 'when has allies' do
			subject { described_class.new name: 'name' , emblem: 'emblem', allies: [ally] }
			let(:ally) { described_class.new(name: 'ally', emblem: 'emblem') }

			it 'returns the name of the kingdom and its allies' do
				expect(subject.inspect).to eq 'name ally'
			end
		end

		context 'when no allies' do
			subject { described_class.new name: 'name' , emblem: 'emblem' }

			it 'returns the name of the kingdom' do
				expect(subject.inspect).to eq 'name'
			end
		end
	end
end