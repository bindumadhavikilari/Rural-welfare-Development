<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Event Form</title>
    <!-- Add the Bootstrap CSS link here -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-5">
        <h2>Event Information</h2>
        <form action="/Portals/AddEvent"  method="POST">
            <div class="form-group">
                <label for="eventName">Event Name</label>
                <input type="text" class="form-control" id="eventName" name="eventName" placeholder="Enter event name">
            </div>
            <div class="form-group">
                <label for="eventPlace">Event Place</label>
                <input type="text" class="form-control" id="eventPlace" name="eventPlace" placeholder="Enter event place">
            </div>
            <div class="form-group">
                <label for="eventDate">Event Date</label>
                <input type="date" class="form-control" id="eventDate" name="eventDate">
            </div>
            <div class="form-group">
                <label for="eventTimeSlot">Event Time Slot</label>
                <input type="time" class="form-control" id="eventTimeSlot" name="eventSlot">
            </div>
            <button type="submit" class="btn btn-primary">Submit</button>
        </form>
    </div>

    <!-- Add the Bootstrap JS and Popper.js (if needed) scripts here -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
