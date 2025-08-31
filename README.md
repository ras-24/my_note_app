# my_note_app

A simple **Note Taking Application** built with Flutter.  
This project demonstrates the basic usage of **Stateless Widgets**, **Stateful Widgets**, **Navigation**, and **Responsive Layouts** in Flutter.

---

## ✨ Features

- **Home Page**
  - Displays a list of notes in a responsive `ListView`.
  - Swipe left to delete a note (using `Dismissible`).
  - Tap a note to edit its content.
  - Floating action button to add a new note.

- **Add Note Page**
  - Built with a `StatefulWidget`.
  - Contains a `TextField` to enter a new note.
  - Saves and sends the note back to the home page.

- **Edit Note Page**
  - Built with a `StatefulWidget`.
  - Pre-fills the existing note in a `TextField`.
  - Allows updating and saving the note.

---

## 🛠️ Technologies Used

- **Flutter** (Dart)
- **Material Design Components**

---

## 🚀 How to Run

1. Make sure you have [Flutter](https://flutter.dev/docs/get-started/install) installed.  
2. Clone this repository:
   ```bash
   git clone https://github.com/your-username/note-app.git
3. Navigate into the project directory:
```
cd note-app
```
4. Run the application:
```
flutter run
```