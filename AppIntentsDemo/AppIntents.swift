import AppIntents

struct BookEntity: AppEntity {
    static var typeDisplayRepresentation: TypeDisplayRepresentation = "Book"
    static var defaultQuery = BookQuery()

    var id: UUID
    
    @Property(title: "Title")
    var title: String
        
    var displayRepresentation: DisplayRepresentation {
        DisplayRepresentation(title: "\(title)")
    }

    init(id: UUID, title: String) {
        self.id = id
        self.title = title
    }
    
}

struct BookQuery: EntityStringQuery {
    
    func entities(for identifiers: [UUID]) async throws -> [BookEntity] {
        library.filter { identifiers.contains($0.id) }.map { book in
            .init(id: book.id, title: book.title)
        }
    }

    func entities(matching query: String) async throws -> [BookEntity] {
        library.filter { $0.title.localizedCaseInsensitiveContains(query) }.map { book in
            .init(id: book.id, title: book.title)
        }
    }
     
    func suggestedEntities() async throws -> [BookEntity] {
        library.map { book in
            .init(id: book.id, title: book.title)
        }
    }
}

struct DemoAction: AppIntent {
    static var title: LocalizedStringResource = "Demo Action"
    
    static var parameterSummary: some ParameterSummary {
        Summary("Demo Action \(\.$books)")
    }

    @Parameter(title: "Books")
    var books: [BookEntity]

    func perform() async throws -> some IntentResult {
        .result()
    }
}

struct Book {
    let id: UUID
    let title: String
}

let library: [Book] = [
    Book(id: UUID(), title: "The Hobbit"),
    Book(id: UUID(), title: "The Lord of the Rings"),
]
