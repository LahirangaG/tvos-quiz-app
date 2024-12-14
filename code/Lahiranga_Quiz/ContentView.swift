import SwiftUI

struct ContentView: View {
    @State private var selectedCategory: String? = nil // Track the selected category

    var body: some View {
        ZStack {
            // Background image
            Image("square") // Use the image from assets
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all) // Ensures the image fills the whole screen
                .opacity(0.5)

            VStack {
                if let category = selectedCategory {
                    // Show the Quiz View for the selected category
                    QuizView(category: category) {
                        // Callback to return to the category selection screen
                        selectedCategory = nil
                    }
                } else {
                    // Show the category selection screen
                    Text("Select a Category")
                        .font(.system(size: 85, weight: .bold)) // Increased font size and made it bold
                        .padding()
                        .foregroundColor(.white) // Make text color white for visibility

                    ForEach(getCategories(), id: \.self) { category in
                        Button(action: {
                            selectedCategory = category
                        }) {
                            HStack {
                                // Add an icon in front of each category button
                                Image(systemName: getIcon(for: category)) // Use SF Symbol
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: getIconSize(for: category), height: getIconSize(for: category)) // Adjust size conditionally
                                    .foregroundColor(.white)
                                
                                Text(category)
                                    .font(.title)
                                    .foregroundColor(.white)
                            }
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color(hex: "#5a67da")) // Set background to #5a67da
                            .cornerRadius(8)
                            .padding(.horizontal)
                        }
                    }
                }
            }
            .padding()
        }
    }

    /// Extract unique categories from the list of questions
    func getCategories() -> [String] {
        return Array(Set(questions.map { $0.category })).sorted()
    }

    /// Get the appropriate SF Symbol icon for each category
    func getIcon(for category: String) -> String {
        switch category {
        case "Animals":
            return "pawprint.fill" // Animal icon
        case "Games":
            return "gamecontroller.fill" // Game controller icon
        case "People":
            return "person.fill" // Person icon
        default:
            return "questionmark.circle.fill" // Default icon for unknown categories
        }
    }

    /// Get the icon size based on the category
    func getIconSize(for category: String) -> CGFloat {
        switch category {
        case "Games":
            return 40 // Larger size for Games category
        default:
            return 30 // Default size for other categories
        }
    }
}

// Custom initializer for Color to accept hex string (handles both # and without #)
extension Color {
    init(hex: String) {
        let hexString = hex.hasPrefix("#") ? String(hex.dropFirst()) : hex // Remove '#' if exists
        let scanner = Scanner(string: hexString)
        var rgb: UInt64 = 0
        if scanner.scanHexInt64(&rgb) {
            let red = Double((rgb & 0xFF0000) >> 16) / 255.0
            let green = Double((rgb & 0x00FF00) >> 8) / 255.0
            let blue = Double(rgb & 0x0000FF) / 255.0
            self.init(red: red, green: green, blue: blue)
        } else {
            self.init(red: 0, green: 0, blue: 0) // Default to black if invalid hex
        }
    }
}
