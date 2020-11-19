require 'spec_helper'

describe 'End to end specs' do
	context "when king shan becomes the ruler and has allies" do
		context 'when single characters are present in emblem name' do
			let(:input_file) { File.join(File.dirname(__FILE__), '..', 'fixtures', 'success_input.txt') }

			let(:expected_output) { "SPACE AIR LAND ICE\n" }

			it 'prints the ruler name along with its allies' do
				expect { system "rake default #{input_file}" }.to output(expected_output).to_stdout_from_any_process
			end
		end

		context "when more than one repeat characters are present in emblem name" do
			let(:input_file) { File.join(File.dirname(__FILE__), '..', 'fixtures', 'other_success_input.txt') }

			let(:expected_output) { "SPACE FIRE AIR WATER\n" }

			it 'prints the ruler name along with its allies' do
				expect { system "rake default #{input_file}" }.to output(expected_output).to_stdout_from_any_process
			end
		end
	end

	context "when king shan fails and has no allies" do
		context 'when no allies are present' do
			let(:input_file) { File.join(File.dirname(__FILE__), '..', 'fixtures', 'failure_input.txt') }

			let(:expected_output) { "NONE\n" }

			it 'prints NONE' do
				expect { system "rake default #{input_file}" }.to output(expected_output).to_stdout_from_any_process
			end
		end

		context 'when messages are repeated' do
			let(:input_file) { File.join(File.dirname(__FILE__), '..', 'fixtures', 'repeat_message_input.txt') }

			let(:expected_output) { "NONE\n" }

			it 'prints NONE' do
				expect { system "rake default #{input_file}" }.to output(expected_output).to_stdout_from_any_process
			end
		end

	end

	context 'an empty file is provided' do
		let(:input_file) { File.join(File.dirname(__FILE__), '..', 'fixtures', 'empty_input.txt') }

		let(:expected_output) { "NONE\n" }

		it 'prints NONE' do
			expect { system "rake default #{input_file}" }.to output(expected_output).to_stdout_from_any_process
		end
	end

	context 'no input file' do
		let(:expected_output) { "Please provide a path to input file\n" }

		it 'prints the correct message' do
			expect { system "rake default" }.to output(expected_output).to_stdout_from_any_process
		end
	end

	context 'incorrect file path is provided' do
		let(:input_file) { File.join(File.dirname(__FILE__), '..', 'fixtures', 'none.txt') }

		let(:expected_output) { "Please provide a path to input file\n" }

		it 'prints the correct message' do
			expect { system "rake default" }.to output(expected_output).to_stdout_from_any_process
		end
	end
end