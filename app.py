# main.py
# Updated backend to support a frontend with CORS and serving index.html

from flask import Flask, request, jsonify, send_from_directory
from flask_cors import CORS # Import CORS
from datetime import datetime
import random

# --- Flask App Initialization ---
app = Flask(__name__)
CORS(app) # Enable CORS for the entire app

# --- Mock Database & Helper Functions ---
mock_events_db = []
mock_users = {
    1: {'role': 'Garden Manager', 'full_name': 'Alice Manager'},
    2: {'role': 'Member', 'full_name': 'Bob Member'},
}

def get_user_role(user_id):
    user = mock_users.get(user_id)
    return user.get('role') if user else None

# --- NEW: Route to serve the frontend ---
@app.route('/')
def serve_index():
    """Serves the index.html file from the current directory."""
    return send_from_directory('.', 'index.html')


# --- API Endpoint to CREATE an event ---
@app.route('/api/gardens/<int:garden_id>/events', methods=['POST'])
def create_event(garden_id):
    user_id_header = request.headers.get('X-User-ID')
    if not user_id_header or not user_id_header.isdigit():
        return jsonify({"error": "Unauthorized: A valid 'X-User-ID' header is required."}), 401
    
    current_user_id = int(user_id_header)
    if get_user_role(current_user_id) != 'Garden Manager':
        return jsonify({"error": "Forbidden: You do not have permission to create an event."}), 403

    data = request.get_json()
    if not data:
        return jsonify({"error": "Bad Request: Invalid or missing JSON payload."}), 400
    
    required_fields = ['title', 'description', 'event_date']
    if not all(field in data and data[field] for field in required_fields):
        return jsonify({"error": "Bad Request: Missing required fields."}), 400

    try:
        datetime.fromisoformat(data['event_date'].replace('Z', '+00:00'))
    except ValueError:
        return jsonify({"error": "Bad Request: 'event_date' must be in a valid ISO 8601 format."}), 400

    new_event = {
        'event_id': random.randint(100, 999),
        'garden_id': garden_id,
        'created_by_user_id': current_user_id,
        'title': data['title'],
        'description': data['description'],
        'event_date': data['event_date'],
        'created_at': datetime.now().isoformat()
    }
    
    mock_events_db.append(new_event)
    print(f"Event created. Current DB state: {mock_events_db}")
    return jsonify(new_event), 201

# --- API Endpoint to GET all events ---
@app.route('/api/gardens/<int:garden_id>/events', methods=['GET'])
def get_events(garden_id):
    events_for_garden = [event for event in mock_events_db if event['garden_id'] == garden_id]
    return jsonify(events_for_garden), 200

if __name__ == '__main__':
    app.run(debug=True)