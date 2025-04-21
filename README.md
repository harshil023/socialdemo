```markdown
# SocialDemo — Flutter Media Feed

A scrollable, mixed‑media feed app built in **Flutter** with **GetX MVC** architecture.  
Fetches and displays images, videos, and text from a mock API. Videos auto‑play when visible, images reside in a swipeable carousel, and users can pull‑to‑refresh or interact via like/comment/share.

---

## 🚀 Built With

- **Flutter**
- **GetX** for state management & routing
- **video_player** for video playback
- **carousel_slider** for image carousels
- **visibility_detector** for auto‑play/pause on scroll
- **share_plus** for native share dialog

---

## 🎯 Project Objective

Fetch posts from:
```
https://my.api.mockaroo.com/posts?key=9794e000
```
and display each in a card with:

- **Video posts**  
  - Auto‑play when ≥50% visible  
  - Auto‑replay on completion  
- **Image posts**  
  - Swipeable carousel (no infinite loop)  
  - Page indicators  
- **Text descriptions**  
- **Pull‑to‑refresh** using `RefreshIndicator`  
- **Post actions**: Like, Comment, Share  

---

## 🗂 Project Structure

```
assets/  
build/  
ios/  
lib/  
├── app/                # App-wide setup (themes, main)  
├── controller/         # GetX controllers (HomeController, etc.)  
├── generated/          # Generated files (localization, etc.)  
├── model/              # Data models (PostModel)  
├── routes/             # App routing definitions  
├── services/           # API service wrapper  
├── style/              # Dimensions, colors, text styles  
├── utils/              # Constants (AppStrings), helpers  
├── views/              # Screens  
│   ├── createpost/  
│   ├── dashboard/  
│   ├── discovery/  
│   ├── home/           # HomeView + subcomponents (Feed Listing Screen)
│   ├── newsplash/  
│   ├── profile/  
│   └── setting/  
└── widgets/            # Reusable widgets (VideoSliderItem, PostActionsWidget)
```

---

## ⚙️ Installation & Running

1. **Clone the repo**  
   ```bash
   git clone https://github.com/harshil023/socialdemo.git
   cd socialdemo
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run on emulator/device**
   ```bash
   flutter run
   ```

---

## 🔑 API Configuration

- **Endpoint**:  
  `https://my.api.mockaroo.com/posts`
- **Query Param**:  
  `?key=9794e000`
- **Method**: GET citeturn1file0

---

## 📐 UI/UX Highlights

- Vertical `ListView` feed with cards
- Auto‑playing videos and pausing off‑screen
- Horizontal `CarouselSlider` for images
- Pull‑to‑refresh gesture
- Like/Comment/Share actions on each post

---

## 📞 Contact & Credits

**Built by:**  
Harshil Thakkar  
✉️thakkarharshil09@gmail.com  
📱+91 7990199392  
🔗(https://www.linkedin.com/in/harshil09)

---

> Made with ❤️ for the Flutter Developer Test Assignment
```