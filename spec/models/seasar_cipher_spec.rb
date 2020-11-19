RSpec.describe SeasarCipher do
	subject { described_class.new message: 'FAIJWJS OOFAMAU', secret_key: 5 }

	describe '#new' do
		it 'initializes message' do
			expect(subject.message).to eq 'FAIJWJS OOFAMAU'
		end

		it 'initializes secret_key' do
			expect(subject.secret_key).to eq 5
		end
	end

	describe '#decrypt' do
		it 'returns the decrypted message' do
			expect(subject.decrypt).to eq 'AVDEREN JJAVHVP'
		end
	end
end