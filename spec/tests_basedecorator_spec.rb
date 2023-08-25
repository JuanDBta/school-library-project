require './base_decorator'

describe BaseDecorator do
  # Arrange: Set up a common object for the tests (mocking Nameable)
  let(:name_able) { instance_double('Nameable') }

  context 'when decorating a Nameable object' do
    it 'correctly delegates correct_name to the decorated object' do
      # Arrange: Set up the expected behavior using the name_able double
      allow(name_able).to receive(:correct_name).and_return('Decorated Name')

      # Act: Create a decorator instance
      decorator = BaseDecorator.new(name_able)

      # Assert: Verify that correct_name returns the correct value from name_able
      expect(decorator.correct_name).to eq('Decorated Name')
    end
  end
end
