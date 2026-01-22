// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "VoiceToTextMacTerminal",
    platforms: [
        .macOS(.v14)
    ],
    products: [
        .executable(
            name: "SuperVoiceAssistant",
            targets: ["SuperVoiceAssistant"]),
        .executable(
            name: "TestDownload",
            targets: ["TestDownload"]),
        .executable(
            name: "ListModels",
            targets: ["ListModels"]),
        .executable(
            name: "DeleteModels",
            targets: ["DeleteModels"]),
        .executable(
            name: "DeleteModel",
            targets: ["DeleteModel"]),
        .executable(
            name: "ValidateModels",
            targets: ["ValidateModels"]),
        .executable(
            name: "TestTranscription",
            targets: ["TestTranscription"]),
        .executable(
            name: "TestLiveTranscription",
            targets: ["TestLiveTranscription"]),
        .library(
            name: "SharedModels",
            targets: ["SharedModels"])
    ],
    dependencies: [
        .package(url: "https://github.com/sindresorhus/KeyboardShortcuts", exact: "1.8.0"),
        .package(url: "https://github.com/argmaxinc/WhisperKit", from: "0.13.0")
    ],
    targets: [
        .target(
            name: "SharedModels",
            dependencies: ["WhisperKit"],
            path: "SharedSources"),
        .executableTarget(
            name: "SuperVoiceAssistant",
            dependencies: ["KeyboardShortcuts", "WhisperKit", "SharedModels"],
            path: "Sources",
            resources: [
                .copy("Assets.xcassets")
            ]),
        .executableTarget(
            name: "TestDownload",
            dependencies: ["WhisperKit", "SharedModels"],
            path: "tests/test-download"),
        .executableTarget(
            name: "ListModels",
            dependencies: ["WhisperKit", "SharedModels"],
            path: "tools/list-models"),
        .executableTarget(
            name: "DeleteModels",
            dependencies: ["SharedModels"],
            path: "tools/delete-models"),
        .executableTarget(
            name: "DeleteModel",
            dependencies: ["SharedModels"],
            path: "tools/delete-model"),
        .executableTarget(
            name: "ValidateModels",
            dependencies: ["WhisperKit", "SharedModels"],
            path: "tools/validate-models"),
        .executableTarget(
            name: "TestTranscription",
            dependencies: ["WhisperKit", "SharedModels"],
            path: "tests/test-transcription"),
        .executableTarget(
            name: "TestLiveTranscription",
            dependencies: ["WhisperKit", "SharedModels"],
            path: "tests/test-live-transcription")
    ]
)
