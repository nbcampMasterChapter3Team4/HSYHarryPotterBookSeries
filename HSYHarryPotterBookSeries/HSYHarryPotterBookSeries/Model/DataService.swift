import Foundation

class DataService {

    enum DataError: Error {
        case fileNotFound
        case parsingFailed
    }

    func loadBooks(completion: @escaping (Result<[Attributes], Error>) -> Void) {
        guard let path = Bundle.main.path(forResource: "data", ofType: "json") else {
            completion(.failure(DataError.fileNotFound))
            return
        }

        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path))

            let decoder = JSONDecoder()
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd"
            formatter.locale = Locale(identifier: "en_US_POSIX")
            decoder.dateDecodingStrategy = .formatted(formatter)

            let bookResponse = try decoder.decode(BookResponse.self, from: data)
            let books = bookResponse.data.map { $0.attributes }
            completion(.success(books))
        } catch {
            print("🚨 JSON 파싱 에러: \(error)")
            completion(.failure(DataError.parsingFailed))
        }
    }
}
