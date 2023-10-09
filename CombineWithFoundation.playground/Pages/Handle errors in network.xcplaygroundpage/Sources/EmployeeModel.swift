import Foundation

public struct EmployeeModel: Codable, Identifiable {
    public let id: Int
    public let username: String
    public let firstName: String
    public let lastName: String
    public let gender: Gender
    public let email: String
    public let department: Department
    public let address: String
    public let avatar: URL
}


public enum Gender: String, Codable {
    case female = "Female"
    case male = "Male"
}

public enum Department: String, Codable {
    
    case accounting = "Accounting"
    case businessDevelopment = "Business Development"
    case engineering = "Engineering"
    case humanResources = "Human Resources"
    case legal = "Legal"
    case marketing = "Marketing"
    case productManagement = "Product Management"
    case researchAndDevelopment = "Research and Development"
    case sales = "Sales"
    case services = "Services"
    case support = "Support"
    case training = "Training"
}
