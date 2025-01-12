# NewsSnippets 📱

#### A cross-platform mobile application built with focus to consume news—fast, simple, and to the point! No more endless scrolling or getting lost in long articles. With NewsSnippets, you get:

- **Concise News Titles**: Every news story summarized in just 60 words, giving you the essence of what’s happening instantly.
- **Deeper Insights**: Want to know more? Dive into the 180-word description for a quick yet detailed overview.
- **Full Story Access**: Still curious? Tap to visit the original source for the complete article.

  
<img src="https://github.com/user-attachments/assets/b5327236-2311-4fdc-b400-6e9f0afceedc" alt="NewsSnippets App Banner" height="450">

## 🌟 Features

### Featured News Carousel

- Interactive CarouselView showcasing weekly highlights
- Smooth animations and intuitive navigation
- Curated content for the best reading experience

### Category-based Navigation

- Organized news sections by categories:
  - Sports
  - Politics
  - Finance
  - Technology
  - Entertainment
  - And more...

### Trending Section

- Real-time updates of the most discussed news
- Popular stories across all categories
- Stay informed about viral content

### Smart Search

- Quick and efficient news search functionality
- Search across all categories and dates
- Real-time search suggestions

### Bookmarks

- Save articles for offline reading
- Organize your favorite news pieces
- Easy access to saved content

### Theme Customization

- Toggle between Dark and Light modes
- Comfortable reading experience
- Personalized visual preferences

## 🎥 Demo

[Demo of app](https://github.com/user-attachments/assets/8d45d749-bbd1-4142-90be-54da35cbea9e)

## 📸 Screenshots

<table>
  <tr>
    <td><img src="https://github.com/user-attachments/assets/b8182924-1fe1-45db-b188-8e83c4b260f9" alt="Featured & Categories" width="150"/></td>
    <td><img src="https://github.com/user-attachments/assets/f986a8b0-7786-4321-a994-ade3e5c1d7f1" alt="Trending" width="150"/></td>
    <td><img src="https://github.com/user-attachments/assets/c8a290ca-eb2d-4e46-be90-088fe9b62860" alt="Search" width="150"/></td>
    <td><img src="https://github.com/user-attachments/assets/0911da2f-c21e-4d4d-9388-12087815ea5e" alt="Bookmarks" width="150"/></td>
  </tr>
  <tr>
    <td><img src="https://github.com/user-attachments/assets/c392d2e3-4cfd-4b30-871c-e0f66399bfac" alt="Featured & Categories" width="150"/></td>
    <td><img src="https://github.com/user-attachments/assets/12b0a49d-1aec-4eaf-8343-7700c8573303" alt="Trending" width="150"/></td>
    <td><img src="https://github.com/user-attachments/assets/93c35b93-6e24-469b-92d5-c853d54e9d36" alt="Search" width="150"/></td>
    <td><img src="https://github.com/user-attachments/assets/7058dbb1-8627-417c-a1d5-7cb5e0f3bf68" alt="Bookmarks" width="150"/></td>
  </tr>
</table>

## 🛠️ Tech Stack

- **Framework:** Flutter
- **State Management:** GetX
- **Data Format:** JSON
- **Architecture:** Clean Architecture
- **API Integration:** REST APIs

## 📦 Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  get: ^4.6.5 # Add actual version
  http: ^0.13.5 # Add actual version
  cached_network_image: ^3.2.3 # Add actual version
  # Add other dependencies
```

## 🚀 Installation

1. Clone the repository

```bash
git clone https://github.com/yourusername/news-snippets.git
```

2. Navigate to the project directory

```bash
cd news-snippets
```

3. Install dependencies

```bash
flutter pub get
```

4. Run the app

```bash
flutter run
```

## 🔧 Configuration

1. Get your API key from [News API Provider]
2. Create a `config.dart` file in the `lib` folder
3. Add your API key:

```dart
class Config {
  static const String apiKey = 'YOUR_API_KEY';
}
```

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 👤 Author

Your Name

- LinkedIn: [Your LinkedIn Profile](your_linkedin_profile_url)
- GitHub: [@yourusername](your_github_profile_url)

## 🙏 Acknowledgments

- Thanks to [News API Provider] for providing the news data
- Flutter community for excellent packages and support
- All contributors who help to improve this project

---

⭐️ If you like NewsSnippets, please give it a star on GitHub! ⭐️
