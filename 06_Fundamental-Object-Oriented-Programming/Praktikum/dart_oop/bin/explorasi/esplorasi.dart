class Book {
  int id;
  String title;
  String publisher;
  double price;
  String category;

  Book(this.id, this.title, this.publisher, this.price, this.category);

  @override
  String toString() {
    return 'Book{id: $id, title: $title, publisher: $publisher, price: $price, category: $category}';
  }
}

class Bookstore {
  List<Book> books = [];

  void addBook(Book book) {
    books.add(book);
  }

  List<Book> getAllBooks() {
    return books;
  }

  void removeBook(int id) {
    books.removeWhere((book) => book.id == id);
  }
}

void main() {
  var bookstore = Bookstore();

  // Menambahkan beberapa buku ke toko buku
  var book1 = Book(1, 'Laskar Pelangi', 'Benteng Pustaka', 20.0, 'Novel');
  var book2 = Book(2, 'Ayat-ayat cinta', 'Republika', 15.0, 'Novel');
  var book3 = Book(3, 'Bumi Manusia', 'Lentera Dirgantara', 18.0, 'Novel');

  bookstore.addBook(book1);
  bookstore.addBook(book2);
  bookstore.addBook(book3);

  // Mendapatkan semua buku dari toko buku
  var allBooks = bookstore.getAllBooks();
  print('All Books:');
  for (var book in allBooks) {
    print(book);
  }

  // Menghapus buku dengan ID 2
  bookstore.removeBook(2);
  print('\nAfter removing book with ID 2:');
  allBooks = bookstore.getAllBooks();
  for (var book in allBooks) {
    print(book);
  }
}
