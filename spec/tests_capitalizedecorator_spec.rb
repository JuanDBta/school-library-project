require './capitalize_decorator'

describe CapitalizeDecorator do
  # Arrange: Set up a common object for the tests (mocking BaseDecorator)
  let(:base_decorator) { instance_double('BaseDecorator') }

  context 'when decorating a BaseDecorator object' do
    it 'correctly capitalizes the name' do
      # Arrange: Set up the expected behavior using the base_decorator double
      allow(base_decorator).to receive(:correct_name).and_return('decorated name')

      # Act: Create a decorator instance
      decorator = CapitalizeDecorator.new(base_decorator)

      # Assert: Verify that correct_name returns the correctly capitalized name
      expect(decorator.correct_name).to eq('Decorated name')
    end
  end
end
