import Foundation

protocol BaseVM {
    associatedtype Input
    associatedtype Output

    func trans(_ input: Input) -> Output
}
