class Genres {
  final String genre;
  final String url;
  Genres({required this.genre, required this.url});
}

class Auths {
  final String auth;
  final String url;
  Auths({required this.auth, required this.url});
}


List <Genres> DefaultGenres = [
  Genres(genre: 'Biography', url: 'https://d1csarkz8obe9u.cloudfront.net/posterpreviews/vintage-biography-book-cover-design-template-315c096b0d90891662841bbdd7d975a2_screen.jpg?ts=1637013314'),
  Genres(genre: 'Business', url: 'https://d1csarkz8obe9u.cloudfront.net/posterpreviews/yellow-business-leadership-book-cover-design-template-dce2f5568638ad4643ccb9e725e5d6ff_screen.jpg?ts=1637017516'),
  Genres(genre: 'Children', url: 'https://marketplace.canva.com/EAD7YHrjZYY/1/0/1003w/canva-blue-illustrated-stars-children%27s-book-cover-haFtaSNXXF4.jpg'),
  Genres(genre: 'Cookery', url: 'https://marketplace.canva.com/EADaoqT-6lY/1/0/1024w/canva-black-italian-photo-of-italian-ingredients-recipe-book-cover-QEqw-sXxZlQ.jpg'),
  Genres(genre: 'Fiction', url: 'https://dw0i2gv3d32l1.cloudfront.net/uploads/stage/stage_image/60159/optimized_large_thumb_stage.jpg'),
  Genres(genre: 'Novel', url: 'https://cms-assets.tutsplus.com/cdn-cgi/image/width=850/uploads/users/1631/posts/32582/image/Book%20Cover%20Template%20for%20Crime%20Thriller%20Novel%20copy.jpg'),

];

List <Auths> DefaultAuths = [
  Auths(auth: 'George Orwell', url: 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/82/George_Orwell%2C_c._1940_%2841928180381%29.jpg/800px-George_Orwell%2C_c._1940_%2841928180381%29.jpg'),
  Auths(auth: 'Dan Brown', url: 'https://upload.wikimedia.org/wikipedia/commons/8/8b/Dan_Brown_bookjacket_cropped.jpg'),
  Auths(auth: 'Leo Tolstoy', url: 'https://upload.wikimedia.org/wikipedia/commons/thumb/b/bb/Ilya_Efimovich_Repin_%281844-1930%29_-_Portrait_of_Leo_Tolstoy_%281887%29.jpg/640px-Ilya_Efimovich_Repin_%281844-1930%29_-_Portrait_of_Leo_Tolstoy_%281887%29.jpg'),
  Auths(auth: 'George R.R Martin', url: 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/ed/Portrait_photoshoot_at_Worldcon_75%2C_Helsinki%2C_before_the_Hugo_Awards_%E2%80%93_George_R._R._Martin.jpg/1200px-Portrait_photoshoot_at_Worldcon_75%2C_Helsinki%2C_before_the_Hugo_Awards_%E2%80%93_George_R._R._Martin.jpg'),
  Auths(auth: 'Tolkien', url: 'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d4/J._R._R._Tolkien%2C_ca._1925.jpg/1200px-J._R._R._Tolkien%2C_ca._1925.jpg'),
];