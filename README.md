# swift-json-resume

swift-json-resume is a package which vends a module called `SwiftyJSONResume` which is a Swifty wrapper around the open-sourced JavaScript library [JSON Resumé Schema](https://jsonresume.org/). This library provides a standardized way to represent resumés and job listings in a structured format. This opens you up to an eco-system of helpful tools such as resumé templates in PDF and HTML, online resumé builders and hosting, and more. See [here](https://jsonresume.org/projects) for a variety of projects that take advantage of the JSON Resumé schema.

## Requirements

- Swift 5.5 or later
- npm (Node Package Manager)

## Installation

To install `SwiftyJSONResume` in your Swift project, add the following dependency to your `Package.swift` file:

```swift
dependencies: [
    .package(url: "https://github.com/your-username/swift-json-resume.git", from: "0.1.0")
]
```

Then, include `SwiftyJSONResume` as a dependency in your target:

```swift
targets: [
    .target(
        name: "YourTargetName",
        dependencies: [
            "SwiftyJSONResume"
        ]
    )
]
```

## Usage

Here's a basic example of how to use `SwiftyJSONResume`:

```swift
import SwiftyJSONResume

let jsonString = """
{
    "basics": {
        "name": "John Doe",
        "label": "Programmer",
        "email": "john.doe@example.com"
    }
}
"""

do {
    let resume = try JSONDecoder().decode(Resume.self, from: Data(jsonString.utf8))
    print("Name: \(resume.basics.name)")
    print("Email: \(resume.basics.email)")
} catch {
    print("Failed to decode JSON: \(error)")
}
```

## Contribution

Contributions are welcome! Please fork the repository and submit a pull request with your changes. Make sure to update the documentation and add tests for any new features or bug fixes.

## License

swift-json-resume is released under the MIT License. See the [LICENSE](LICENSE) file for more information.

## Acknowledgements

This project is inspired by and utilizes the [JSON Resumé Schema](https://jsonresume.org/). Special thanks to the creators and maintainers of that project.

## Contact
For any questions or feedback, please open an issue.

