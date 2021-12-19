import Foundation

let fm = FileManager.default

// Write script to temporary file

guard let scriptData = CommandLine.arguments[1].data(using: .utf8) else {
    enum InvalidStringError: Error {
        case notUTF8
    }
    
    throw InvalidStringError.notUTF8
}

let targetURL = URL(fileURLWithPath: "/opt/swift/tmp/string_script.swift")
fm.createFile(atPath: targetURL.path, contents: scriptData)

// Execute script

let executeScript = Process()
executeScript.executableURL = .init(fileURLWithPath: "/usr/bin/env")
executeScript.arguments = ["swift", targetURL.path]
executeScript.currentDirectoryURL = .init(fileURLWithPath: "/content")

do {
    try executeScript.run()
} catch {
    print(error.localizedDescription)
}

executeScript.waitUntilExit()
