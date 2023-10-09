
import Combine
import Foundation

let domain = "http://127.0.0.1:8080/CombineCourse"

let employeeUrl = URL(string: "\(domain)/employees")!
let errorUrl = URL(string: "\(domain)/error")!
let timeoutUrl = URL(string:"\(domain)/timeout")!

var subscribers = Set<AnyCancellable>()

let config = URLSessionConfiguration.ephemeral
//config.timeoutIntervalForRequest = 3
let session = URLSession(configuration: config)

session.dataTaskPublisher(for:  employeeUrl)
    .mapError { error -> NetworkError in
        
        if error.errorCode == -1001 {
            return .timeout(error.localizedDescription)
        }
        return .general(error.localizedDescription)
    }
    .retry(3)
    .timeout(.seconds(3), scheduler: RunLoop.main, options: nil) { .timeout("It took more than three seconds") }
    .tryMap { (data, response) in
        
        guard let response = response as? HTTPURLResponse else { throw NetworkError.badConnection("Invalid connection") }
        let statusCode = response.statusCode
        guard statusCode == 200 else { throw NetworkError.notFound("Status code: \(statusCode) ") }
        return data
    }
    .decode(type: [EmployeeModel].self, decoder: JSONDecoder() )
    .sink { completion in
        if case .failure(let err) = completion, let netError = err as? NetworkError {
            switch netError {
            case .general(let string):
                print("General error - \(string)")
            case .timeout(let string):
                print("Timeout - \(string)")
            case .notFound(let string):
                print("Not found - \(string)")
            case .badConnection(let string):
                print("Bad connection - \(string)")
            }
        }
    } receiveValue: { employees  in
        print(employees.first?.username ?? "nil")
        print(employees)
    }
    .store(in: &subscribers)

