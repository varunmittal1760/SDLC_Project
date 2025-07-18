# GreenFingers SG: AI-Accelerated Web App Prototype

**Project Date:** July 18, 2025
**Status:** Completed Prototype

---

## 1. Overview

This project documents the rapid development of a full-stack web application prototype, "GreenFingers SG," designed for community garden event management. The primary goal was not just to build the application, but to demonstrate an **AI-Accelerated Software Development Life Cycle (SDLC)**.

Using a conversational AI, we moved from a high-level concept to a functional, locally-hosted application in a fraction of the time required by traditional methods. The final product features a clean, modern user interface for creating and viewing events, powered by a Python Flask backend.


---

## 2. Core Features

-   **Event Creation:** A user-friendly form allows users (authenticated as 'Garden Managers') to create new events with a title, description, and date/time.
-   **Real-time Event List:** A dynamic list on the main page fetches and displays all upcoming events from the backend.
-   **API Backend:** A robust Flask-based API with endpoints for creating (`POST`) and retrieving (`GET`) events.
-   **Role-Based Access Control (RBAC):** The event creation endpoint is protected, simulating a system where only authorized users can add events.

---

## 3. Technology Stack

-   **Backend:**
    -   **Language:** Python 3
    -   **Framework:** Flask
    -   **API Security:** Flask-CORS for enabling cross-origin requests from the frontend.
-   **Frontend:**
    -   **Structure:** HTML5
    -   **Styling:** Tailwind CSS for a modern, responsive design.
    -   **Logic:** Vanilla JavaScript with `async/await` for API communication.
-   **Development Tools:**
    -   **Editor:** Visual Studio Code
    -   **API Testing:** Thunder Client (VSCode Extension)
    -   **Core Engine:** Conversational AI (Large Language Model)

---

## 4. Project Workflow: An AI-Accelerated SDLC

This project's key innovation was its methodology. We treated the AI as a development partner, using targeted prompts to automate the most time-consuming tasks in each phase of the SDLC.

### Phase 1: Planning & Requirements

-   **Objective:** Define the project scope and user needs.
-   **AI Prompt:** *"Act as an expert product manager. I want to build a mobile app for local community gardening. Brainstorm a list of 5 core features for the MVP..."*
-   **AI Output:** Generated detailed User Stories and a formal Software Requirements Specification (SRS) document.
-   **Result:** The entire requirements-gathering phase was completed in minutes.

### Phase 2: System Design

-   **Objective:** Create the technical blueprint for the application.
-   **AI Prompts:**
    -   *"Suggest a modern technology stack for a small team..."*
    -   *"Design a simple SQL database schema..."*
    -   *"Define the necessary REST API endpoints..."*
-   **AI Output:** Provided a complete tech stack recommendation, `CREATE TABLE` statements for the database, and a full API design specification in Markdown.
-   **Result:** The architectural design was generated instantly, providing clear blueprints for development.

### Phase 3: Development

-   **Objective:** Write the source code for the backend and frontend.
-   **AI Prompts:**
    -   *"Write the Python Flask code for the `POST /api/gardens/{garden_id}/events` endpoint..."*
    -   *"Now, write the code for the `GET` endpoint..."*
    -   *"Build the frontend for this application in a single `index.html` file using Tailwind CSS and JavaScript..."*
-   **AI Output:** Generated complete, runnable code for `app.py` and `index.html`, including backend logic, API communication, styling, and error handling.
-   **Result:** Automated the creation of over 90% of the initial codebase. Our role shifted from *writing* code to *integrating and verifying* AI-generated code.

### Phase 4: Testing & Debugging

-   **Objective:** Ensure the application works as expected and fix errors.
-   **Process:** We used Thunder Client to manually test the API endpoints. When errors occurred (e.g., `ModuleNotFoundError`, `404 Not Found`, incorrect headers), we fed the error messages back to the AI.
-   **AI Prompt:** *"I'm getting this error. What does it mean and how do I fix it?"*
-   **AI Output:** Correctly diagnosed the environment issue and provided the exact commands to resolve it.
-   **Result:** Dramatically reduced debugging time by using the AI as an interactive diagnostic tool.

---

## 5. How to Run the Project Locally

1.  **Prerequisites:**
    -   Python 3 installed.
    -   `pip` for package management.

2.  **Clone the Repository:**
    ```bash
    git clone https://github.com/varunmittal1760/SDLC_Project.git
    cd SDLC_Project
    ```

3.  **Set Up a Virtual Environment:**
    ```bash
    python -m venv venv
    source venv/bin/activate  # On Windows, use `venv\Scripts\activate`
    ```
4.  **Install Dependencies:**
    ```bash
    pip install -r requirements.txt
    ```

5.  **Run the Backend Server:**
    ```bash
    # Run the App
    flask run

    ```
    The server will start on `http://127.0.0.1:5000`.

6.  **Launch the Application:**
    -   Open your web browser and navigate to `http://127.0.0.1:5000/`.
    -   The `index.html` page will be served, and you can now interact with the application.
