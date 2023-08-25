require './trimmer_decorator'

describe TrimmerDecorator do
  # Arrange: Set up a common object for the tests (mocking BaseDecorator)
  let(:base_decorator) { instance_double('BaseDecorator') }

  context 'when decorating a BaseDecorator object' do
    it 'trims the name if longer than 10 characters' do
      # Arrange: Set up the expected behavior using the base_decorator double
      allow(base_decorator).to receive(:correct_name).and_return('Long Name Here')

      # Act: Create a decorator instance
      decorator = TrimmerDecorator.new(base_decorator)

      # Assert: Verify that correct_name returns the correctly trimmed name
      expect(decorator.correct_name).to eq('Long Name ')
    end

    it 'does not trim the name if not longer than 10 characters' do
      # Arrange: Set up the expected behavior using the base_decorator double
      allow(base_decorator).to receive(:correct_name).and_return('Short Name')

      # Act: Create a decorator instance
      decorator = TrimmerDecorator.new(base_decorator)

      # Assert: Verify that correct_name returns the unchanged short name
      expect(decorator.correct_name).to eq('Short Name')
    end
  end
end
