RSpec.describe Cipher do
	subject { described_class.new message: 'OWL' }

	describe '#new' do
		it 'initializes the message' do
			expect(subject.message).to eq 'OWL'
		end
	end
end