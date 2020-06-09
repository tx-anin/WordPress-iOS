import Foundation


// MARK: - String: RegularExpression Helpers
//
extension String {
    /// Replaces all matches of a given RegEx, with a template String.
    ///
    /// - Parameters:
    ///     - regex: the regex to use.
    ///     - template: the template string to use for the replacement.
    ///     - options: the regex options.
    ///
    /// - Returns: a new string after replacing all matches with the specified template.
    ///
    func replacingMatches(of regex: String, with template: String, options: NSRegularExpression.Options = []) -> String {

        let regex = try! NSRegularExpression(pattern: regex, options: options)
        let fullRange = NSRange(location: 0, length: count)

        return regex.stringByReplacingMatches(in: self,
                                              options: [],
                                              range: fullRange,
                                              withTemplate: template)
    }
}
