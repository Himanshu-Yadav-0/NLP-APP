# NLP Web App

## Overview
This is a Flask-based NLP web application that implements **Named Entity Recognition (NER)** using **spaCy** and many more features yet to be implemented. The application allows users to register, log in, and extract named entities from the text.

## Features
- User authentication (Registration & Login)
- Named Entity Recognition (NER) using **spaCy**
- Web-based UI using Flask & Jinja2 templates
- JSON-based user storage (No SQL database required)
- Containerized deployment using **Docker**
- **CI/CD pipeline using Jenkins**
- **Deployed on Google Cloud Compute Engine**

## Tech Stack
- **Backend:** Flask
- **NLP Library:** spaCy
- **Frontend:** Jinja2, HTML, CSS
- **Storage:** JSON-based user database
- **Containerization:** Docker
- **CI/CD:** Jenkins
- **Cloud Deployment:** Google Cloud Compute Engine

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
   docker build -t nlp-app .
   ```

3. **Run the container locally (optional test):**
   ```bash
   docker run -p 5050:5050 nlp-app
   ```

---

## CI/CD Pipeline using Jenkins

### **Setting up Jenkins for CI/CD**
1. **Install Jenkins on Google Cloud Compute Engine:**
   - Deploy a VM instance on GCP.
   - Install Jenkins:
     ```bash
     sudo apt update
     sudo apt install openjdk-11-jdk -y
     wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo tee /usr/share/keyrings/jenkins-keyring.asc > /dev/null
     echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/" | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null
     sudo apt update
     sudo apt install jenkins -y
     sudo systemctl enable jenkins
     sudo systemctl start jenkins
     ```

2. **Setup Jenkins Job for Automated Deployment:**
   - In Jenkins, create a new freestyle project.
   - Under `Source Code Management`, select Git and provide your repository URL.
   - Add the following build steps under `Execute Shell`:
     ```bash
     docker stop nlp-app || true
     docker rm nlp-app || true
     docker build -t nlp-app .
     docker run -p 5050:5050 -d nlp-app
     ```
   - Save and run the job.

---

## Deploying to Google Cloud Compute Engine

### **Steps to Deploy on GCP VM**

1. **Create a GCP VM instance:**
   ```bash
   gcloud compute instances create nlp-app-server \
       --machine-type=e2-medium \
       --image-family=debian-11 \
       --image-project=debian-cloud \
       --boot-disk-size=20GB \
       --tags=http-server,https-server \
       --metadata=startup-script="sudo apt update && sudo apt install -y docker.io && sudo systemctl start docker"
   ```

2. **SSH into the VM and pull the repository:**
   ```bash
   gcloud compute ssh nlp-app-server
   git clone https://github.com/Himanshu-Yadav-0/NLP-APP.git
   cd NLP-APP
   ```

3. **Run the container on the VM:**
   ```bash
   docker build -t nlp-app .
   docker run -p 5050:5050 -d nlp-app
   ```

4. **Configure Firewall Rules for External Access:**
   ```bash
   gcloud compute firewall-rules create allow-nlp-app \
       --allow=tcp:5050 --source-ranges=0.0.0.0/0
   ```

5. **Access the application at:**
   ```
   http://<your-vm-external-ip>:5050
   ```

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

