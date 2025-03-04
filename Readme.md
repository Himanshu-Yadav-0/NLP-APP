# NLP Web App

## Overview
This is a Flask-based NLP web application that implements **Named Entity Recognition (NER)** using **spaCy** and Many more yet to implement. The application allows users to register, log in, and extract named entities from the text.

## Features
- User authentication (Registration & Login)
- Named Entity Recognition (NER) using **spaCy**
- Web-based UI using Flask & Jinja2 templates
- JSON-based user storage (No SQL database required)

## Tech Stack
- **Backend:** Flask
- **NLP Library:** spaCy
- **Frontend:** Jinja2, HTML, CSS
- **Storage:** JSON-based user database

## Installation

### Prerequisites
Ensure you have Python installed (>=3.8). Then, install dependencies:

```bash
pip install -r requirements.txt
```

### Running the Application

1. Run the Flask app:
   ```bash
   python app.py
   ```
2. Open `http://127.0.0.1:5050/` in your browser.

## File Structure
```
📦 NLP Web App
├── app.py              # Main Flask application
├── db.py               # User authentication logic
├── users.json          # JSON database for storing user data
├── requirements.txt    # Dependencies
├── templates/          # HTML files for UI
│   ├── login.html
│   ├── register.html
│   ├── ner.html
│   ├── profile.html
```

## API Endpoints

| Route | Method(s) | Description |
|--------|-----------|-------------|
| `/` | GET | Home/Login page |
| `/register` | GET | Registration page |
| `/perform_registration` | POST | Actually performs the registration |
| `/perform_login` | POST | Actually performs login and starts the session |
| `/profile` | GET | shows many option for NLP to select one from |
| `/ner` | GET | Named entity recoginition |
| `/perform_ner` | POST | Actually performs the NER |
| `/logout` | GET | logout |
| `/sentiment_analysis` | GET | Yet to create, Please feel free to contribute |
| `/abuse_detection` | GET | Yet to create, Please feel free to contribute |

## Usage
1. **Register** a new account.
2. **Login** with your credentials.
3. Enter text to analyze and extract named entities.

## Future Enhancements
- Improve UI/UX with Bootstrap
- Store users in an SQL database (e.g., SQLite, PostgreSQL)
- Implement more NLP features

## Contributing
We welcome contributions! To contribute:
1. Fork this repository.
2. Create a new branch (`git checkout -b feature-branch`).
3. Make your changes and commit (`git commit -m 'Add new feature'`).
4. Push to the branch (`git push origin feature-branch`).
5. Submit a pull request.

## Contributors
- **Himanshu Yadav**

---
### License
This project is licensed under the MIT License.

