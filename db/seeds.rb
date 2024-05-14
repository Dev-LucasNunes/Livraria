# Limpa todos os registros de livros e autores existentes
Author.destroy_all
Book.destroy_all
# Criação dos autores
authors = [
  { name: 'Machado de Assis', nationality: 'Brasileiro', cpf: '245.702.920-09', date_of_birth: '1839-06-21' },
  { name: 'Clarice Lispector', nationality: 'Brasileiro', cpf: '271.487.570-76', date_of_birth: '1920-12-10' },
  { name: 'Guimarães Rosa', nationality: 'Brasileiro', cpf: '022.229.990-93', date_of_birth: '1908-06-27' },
  { name: 'Carlos Drummond de Andrade', nationality: 'Brasileiro', cpf: '788.826.670-04', date_of_birth: '1902-10-31' },
  { name: 'Jorge Amado', nationality: 'Brasileiro', cpf: '587.809.690-02', date_of_birth: '1912-08-10' },
  { name: 'Érico Veríssimo', nationality: 'Brasileiro', cpf: '460.112.870-18', date_of_birth: '1905-12-17' },
  { name: 'Graciliano Ramos', nationality: 'Brasileiro', cpf: '174.673.390-00', date_of_birth: '1892-10-27' },
  { name: 'Rubem Fonseca', nationality: 'Brasileiro', cpf: '096.643.350-02', date_of_birth: '1925-05-11' },
  { name: 'Cecília Meireles', nationality: 'Brasileiro', cpf: '229.507.500-70', date_of_birth: '1901-11-07' },
  { name: 'Mário de Andrade', nationality: 'Brasileiro', cpf: '280.288.540-87', date_of_birth: '1893-10-09' }
]


# Criação dos autores
authors.each do |author_attrs|
  Author.create!(author_attrs)
end

# Criação dos livros relacionados aos autores
books = [
  { title: 'Dom Casmurro', genre: 'Romance', publication_date: '1899-01-01', isbn: '978-85-7536-125-2', author_name: 'Machado de Assis' },
  { title: 'A Hora da Estrela', genre: 'Romance', publication_date: '1977-01-01', isbn: '978-85-359-0207-4', author_name: 'Clarice Lispector' },
  { title: 'Grande Sertão: Veredas', genre: 'Romance', publication_date: '1956-01-01', isbn: '978-85-254-2294-8', author_name: 'Guimarães Rosa' },
  { title: 'Sentimento do Mundo', genre: 'Poesia', publication_date: '1940-01-01', isbn: '978-85-254-2294-8', author_name: 'Carlos Drummond de Andrade' },
  { title: 'Dona Flor e Seus Dois Maridos', genre: 'Romance', publication_date: '1966-01-01', isbn: '978-85-01-00018-6', author_name: 'Jorge Amado' },
  { title: 'Olhai os Lírios do Campo', genre: 'Romance', publication_date: '1938-01-01', isbn: '978-85-01-06258-7', author_name: 'Érico Veríssimo' },
  { title: 'Vidas Secas', genre: 'Romance', publication_date: '1938-01-01', isbn: '978-85-01-00018-6', author_name: 'Graciliano Ramos' },
  { title: 'O Cobrador', genre: 'Contos', publication_date: '1979-01-01', isbn: '978-85-01-05423-4', author_name: 'Rubem Fonseca' },
  { title: 'Espectros', genre: 'Poesia', publication_date: '1919-01-01', isbn: '978-85-01-00018-6', author_name: 'Cecília Meireles' },
  { title: 'Macunaíma', genre: 'Romance', publication_date: '1928-01-01', isbn: '978-85-01-00018-6', author_name: 'Mário de Andrade' }
]

# Criação dos livros
books.each do |book_attrs|
  author = Author.find_by(name: book_attrs.delete(:author_name))
  Book.create!(author: author, **book_attrs)
end

# Limpa todos os registros de fornecedores e contas bancárias existentes
Supplier.destroy_all
Account.destroy_all

# Criação dos fornecedores e suas contas bancárias
suppliers = [
  {
    name: 'Papelaria do Saber',
    address: 'Rua dos Livros, 123',
    contact: 'papelaria_saber@example.com',
    cnpj: '00.000.000/0001-01',
    account_attributes: { account: '1234', account_digit: '1', account_type: 'Corrente', bank: 'Banco A' }
  },
  {
    name: 'Impressões Literárias',
    address: 'Avenida das Páginas, 456',
    contact: 'impressoes_literarias@example.com',
    cnpj: '11.111.111/1111-11',
    account_attributes: { account: '5678', account_digit: '2', account_type: 'Poupança', bank: 'Banco B' }
  },
  {
    name: 'Editora Imaginação',
    address: 'Travessa dos Sonhos, 789',
    contact: 'editora_imaginacao@example.com',
    cnpj: '22.222.222/2222-22',
    account_attributes: { account: '9012', account_digit: '3', account_type: 'Corrente', bank: 'Banco C' }
  },
  {
    name: 'Gráfica do Conhecimento',
    address: 'Rua das Ideias, 1011',
    contact: 'grafica_conhecimento@example.com',
    cnpj: '33.333.333/3333-33',
    account_attributes: { account: '3456', account_digit: '4', account_type: 'Poupança', bank: 'Banco D' }
  },
  {
    name: 'Encadernação Arte & Livros',
    address: 'Alameda das Capas, 1213',
    contact: 'encadernacao_arte_livros@example.com',
    cnpj: '44.444.444/4444-44',
    account_attributes: { account: '7890', account_digit: '5', account_type: 'Corrente', bank: 'Banco E' }
  }
]

# Criação dos fornecedores e suas contas bancárias
suppliers.each do |supplier_attrs|
  account_attrs = supplier_attrs.delete(:account_attributes)
  supplier = Supplier.create!(supplier_attrs)
  supplier.create_account(account_attrs)
end

