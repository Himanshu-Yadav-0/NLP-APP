# NLP Web App

## Overview
This is a Flask-based NLP web application that implements **Named Entity Recognition (NER)** using **spaCy** and many more yet to implement. The application allows users to register, log in, and extract named entities from the text.

## Features
- User authentication (Registration & Login)
- Named Entity Recognition (NER) using **spaCy**
- Web-based UI using Flask & Jinja2 templates
- JSON-based user storage (No SQL database required)
- Containerized deployment using **Docker**
- Hosted on **Google Cloud Run**

## Tech Stack
- **Backend:** Flask
- **NLP Library:** spaCy
- **Frontend:** Jinja2, HTML, CSS
- **Storage:** JSON-based user database
- **Containerization:** Docker
- **Cloud Deployment:** Google Cloud Run

## Installation

### Prerequisites
Ensure you have Python installed (>=3.8). Then, install dependencies:

```bash
pip install -r requirements.txt
```

### Running the Application Locally

1. Run the Flask app:
   ```bash
   python app.py
   ```
2. Open `http://127.0.0.1:5050/` in your browser.

---

## Deployment

### **Containerizing the Application with Docker**

1. **Create a `Dockerfile` in the project root:**
   ```dockerfile
   FROM python:3.9
   WORKDIR /app
   COPY . /app
   RUN pip install -r requirements.txt
   CMD ["python", "app.py"]
   ```

2. **Build and tag the Docker image:**
   ```bash
   docker build -t <image-name> .
   ```

3. **Run the container locally (optional test):**
   ```bash
   docker run -p 5050:5050 <image-name>
   ```

### **Pushing Docker Image to Google Cloud Artifact Registry**

1. **Authenticate Docker with Google Cloud:**
   ```bash
   gcloud auth configure-docker <region>-docker.pkg.dev
   ```

2. **Tag the Docker image for Artifact Registry:**
   ```bash
   docker tag <image-name> <region>-docker.pkg.dev/<project-id>/<repo-name>/<image-name>
   ```

3. **Push the image to Artifact Registry:**
   ```bash
   docker push <region>-docker.pkg.dev/<project-id>/<repo-name>/<image-name>
   ```

### **Deploying to Google Cloud Run**

1. **Deploy using `gcloud run deploy`:**
   ```bash
   gcloud run deploy <service-name> \
     --image=<region>-docker.pkg.dev/<project-id>/<repo-name>/<image-name> \
     --platform managed \
     --region=<region> \
     --allow-unauthenticated
   ```

2. **Retrieve the service URL and access the application.**

---

## File Structure
```
📦 NLP Web App
├── app.py              # Main Flask application
├── db.py               # User authentication logic
├── users.json          # JSON database for storing user data
├── requirements.txt    # Dependencies
├── Dockerfile          # Containerization setup
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
| `/profile` | GET | Shows options for NLP tasks |
| `/ner` | GET | Named Entity Recognition |
| `/perform_ner` | POST | Actually performs the NER |
| `/logout` | GET | Logout |
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

