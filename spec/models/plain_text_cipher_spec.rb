RSpec.describe PlainTextCipher do
	subject { described_class.new message: 'OWL' }

	describe '#decrypt' do
		it 'returns the message as is' do
			expect(subject.decrypt).to eq 'OWL'
		end
	end
end