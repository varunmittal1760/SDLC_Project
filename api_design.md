API Design Specification: Event Scheduling
This document outlines the REST API endpoints for the "Event Scheduling" feature of the GreenFingers SG application.

Base URL: /api/gardens/{garden_id}/

1. Get All Events for a Garden

Method: GET

URL Path: /api/gardens/{garden_id}/events

Description: Retrieves a list of all upcoming and past events for a specific garden. This is used to populate the main event list view for members.

Success Response: 200 OK with a JSON array of event objects.

2. Create a New Event

Method: POST

URL Path: /api/gardens/{garden_id}/events

Description: Creates a new event for a specific garden. This endpoint must be protected and only accessible by users with a 'Garden Manager' role.

Request Body (JSON):

{
  "title": "Weekend Weeding & Composting",
  "description": "We will be clearing out plot A and turning the compost pile. Please bring gloves.",
  "event_date": "2025-08-15T10:00:00"
}

Success Response: 201 Created with the newly created event object.

3. Get a Single Event's Details

Method: GET

URL Path: /api/gardens/{garden_id}/events/{event_id}

Description: Retrieves the full details for a single, specific event, including its description and a list of attendees.

Success Response: 200 OK with a single event object.

4. Update an Existing Event

Method: PUT or PATCH

URL Path: /api/gardens/{garden_id}/events/{event_id}

Description: Updates the details of an existing event. This is a protected endpoint for 'Garden Managers' only.

Success Response: 200 OK with the updated event object.

5. Delete an Event

Method: DELETE

URL Path: /api/gardens/{garden_id}/events/{event_id}

Description: Deletes or cancels an event. This is a protected endpoint for 'Garden Managers' only.

Success Response: 204 No Content.

6. RSVP to an Event

Method: POST

URL Path: /api/gardens/{garden_id}/events/{event_id}/rsvps

Description: Allows the currently authenticated user to RSVP for an event.

Request Body (JSON):

{
  "user_id": "current_user_id_from_token",
  "status": "Going"
}

Success Response: 201 Created with the new RSVP object.

7. Get RSVPs for an Event

Method: GET

URL Path: /api/gardens/{garden_id}/events/{event_id}/rsvps

Description: Retrieves a list of all users who have RSVP'd for a specific event. This is primarily for the Garden Manager to see who is attending.

Success Response: 200 OK with a JSON array of user objects who have RSVP'd.