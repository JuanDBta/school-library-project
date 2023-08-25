require './book'

describe Book do
  # Set: Common variables for the test suite
  let(:book_title) { 'Sample Book' }
  let(:book_author) { 'Jane Doe' }
  let(:book) { Book.new(book_title, book_author) }

  context 'when initializing a book' do
    it 'sets the title and author' do
      # Arrange: No additional setup required, using 'book' instance from let
      # Act: No explicit action, as it's done in the 'set' phase
      # Assert: Check whether the title and author are correctly set
      expect(book.title).to eq(book_title)
      expect(book.author).to eq(book_author)
    end

    it 'initializes an empty rentals array' do
      # Arrange: No additional setup required, using 'book' instance from let
      # Act: No explicit action, as it's done in the 'set' phase
      # Assert: Check whether the 'rentals' array is empty
      expect(book.rentals).to be_empty
    end
  end

  context 'when adding a rental to a book' do
    let(:book) { Book.new('A', 'B') } 
    let(:person) { Person.new(15, name: 'John Doe', parent_permission: true) }  
    let(:rental) { instance_double('Rental') }
    let(:date) { '01-01-1900' }

    before do
      allow(Rental).to receive(:new).with(date, book, person).and_return(rental)
      allow(rental).to receive(:date).and_return(date)
      allow(rental).to receive(:person).and_return(person)

      book.add_rental(date, person)
    end

    it 'adds the rental to the rentals array' do
      expect(book.rentals).to include(rental)
    end
  end
end




end