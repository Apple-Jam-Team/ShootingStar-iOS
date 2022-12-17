import RxFlow

extension Step {
    var asAppJamStep: AppjamStep? {
        return self as? AppjamStep
    }
}
