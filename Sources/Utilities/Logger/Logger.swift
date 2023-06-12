//
//  Logger.swift
//  
//
//  Created by Manu on 12/06/2023.
//

import Foundation

/// The Console Logger to use across the app.
/// You can change the verbosity level like this: `Logger.verbosity = $newValue`.
public enum Logger {
    /// The key for user defaults.
    public static let defaultsKey = "logger.verbosity"

    /// The verbosity level of the logger.
    /// Check `LogVerbosity` for more information.
    public static var verbosity: Logger.Verbosity = Logger.Verbosity.verbose {
        didSet {
            setVerboseLevel(verbosity)
        }
    }

    /// Initializer for the logger.
    /// This method is supposed to be called during your app initializer code.
    /// Checks the UserDefaults for a saved verbosity value.
    /// If there is a saved value, it's set it to the Logger's verbosity property.
    public static func initialize() {
        guard let savedValue = UserDefaults.standard.string(forKey: defaultsKey),
              let verbosity = Logger.Verbosity(rawValue: savedValue) else {
            self.verbosity = Logger.Verbosity.verbose
            return
        }
        self.verbosity = verbosity
    }

    /// Logs a message to the console.
    /// - Parameters:
    ///   - level: The severity level of the log.
    ///   This will play together with the `verbosity` property to determine if the message will be logged.
    ///   - string: The message to be logged.
    public static func log(
        _ level: Logger.Level,
        _ string: @autoclosure () -> String,
        fileName: StaticString = #file,
        funcName: StaticString = #function
    ) {
        #if DEBUG
        let file = NSString(string: fileName.description).lastPathComponent
        if verbosity.shouldLog(level: level) {
            let log = "\(level.rawValue) ==> - In: \(file)#\(funcName) -\n\(string())\n\(level.rawValue) <==\n"
            Swift.print(log)
        }
        #endif
    }
}

private extension Logger {
    static func setVerboseLevel(_ verbosity: Logger.Verbosity) {
        Swift.print("Changing logger verbosity to \(verbosity.rawValue)")
        UserDefaults.standard.set(verbosity.rawValue, forKey: defaultsKey)
        UserDefaults.standard.synchronize()
    }
}

public extension Logger {
    /// Severity level of the log message.
    enum Level: String {
        /// error
        case err = "[‼️]"
        /// warning
        case warn = "[⚠️]"
        /// information
        case info = "[ℹ️]"
    }

    /// Verbosity Options.
    enum Verbosity: String, CaseIterable {
        /// Only error messages are logged.
        case error
        /// Warning, and error messages are logged.
        case warning
        /// Informational, warning, and error messages are logged.
        case info
        /// Informational, warning, and error messages are logged, plus the network requests and responses.
        case verbose

        func shouldLog(level: Logger.Level) -> Bool {
            switch self {
            case .error:
                return level == .err
            case .warning:
                return level == .err || level == .warn
            case .info:
                return level == .err || level == .warn || level == .info
            case .verbose:
                return true
            }
        }
    }
}



/// Writes the textual representations of the given items into the standard output.
@available(*, deprecated, message: "You should use the Logger")
public func print(_ object: Any) {
    // Only allowing in DEBUG mode
    #if DEBUG
        Swift.print(object)
    #endif
}
