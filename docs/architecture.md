# Service Booking Platform – Architecture Proposal

## 1. Tech Stack

* Mobile (Flutter): Enables fast cross-platform development and reduces time to market.
* Web Admin (React): Suitable for scalable and maintainable admin interfaces.
* Backend (Node.js - Express): Lightweight and efficient for building REST APIs.
* Database (MongoDB): Flexible schema supports evolving MVP requirements.
* Authentication (JWT): Stateless and scalable authentication mechanism.

---

## 2. System Design

The system follows a modular monolith architecture.

Flow:
Mobile/Web → Backend API → Database

* Mobile app and admin panel consume the same APIs.
* Backend handles business logic.
* Database stores user, service, and booking data.

This approach ensures faster development and avoids unnecessary complexity.

---

## 3. API Structure

POST /auth/login
GET /services
POST /bookings
GET /bookings

These APIs cover authentication, service listing, and booking flow.

---

## 4. Authentication

* JWT-based authentication
* Token returned on login
* Stored on client
* Verified using middleware

Ensures secure and scalable communication.

---

## 5. Deployment / Infrastructure

* Backend: AWS EC2 / Render
* Database: MongoDB Atlas
* Mobile: APK/TestFlight distribution

---

## 6. CI/CD

Using GitHub Actions:

* Code push triggers pipeline
* Install dependencies
* Run checks
* Deploy backend

---

## 7. Risks & Tradeoffs

Risks:

* Tight timeline may affect completeness
* Scaling challenges with high traffic
* Dependency between frontend/backend teams

Tradeoffs:

* Modular monolith over microservices for speed
* Focus on MVP features over advanced capabilities

---

## Conclusion

The architecture focuses on rapid MVP delivery while ensuring scalability and maintainability.
