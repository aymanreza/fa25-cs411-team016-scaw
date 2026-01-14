# GardenPlot – Full-Stack Web Application

A full-stack web application that helps users plan, manage, and analyze garden plots by combining structured data storage, user interaction, and external data sources.

---

## Project Context

This repository is a **personal mirror** of a team project developed at at the University of Illinois Urbana-Champaign.

The original development occurred in a course organization repository.  
This copy exists for **portfolio and demonstration purposes**.

---

## Overview

GardenPlot is a web application that allows users to:
- Create and manage garden plots and plant entries
- Store and query structured gardening data
- Analyze plant information using relational queries
- Integrate external datasets (e.g., weather and USDA plant data)

The project emphasizes **database design, backend logic, and full-stack integration**, with a focus on correctness, data integrity, and scalability.

---

## System Architecture

### Frontend
- React (Vite)
- Dynamic UI for managing plots, plants, and user data
- Client-side validation and state management

### Backend
- Node.js with Express
- RESTful API endpoints
- Authentication and user session handling
- Business logic separated from data access

### Database
- MySQL (Google Cloud SQL)
- Normalized relational schema
- Triggers, stored procedures, and indexing for performance

---

## My Contributions

I was responsible for significant portions of the backend, database design, and full-stack integration, including:

### Database Design & Optimization
- Designed a normalized relational schema for users, plots, plants, and metadata
- Implemented SQL triggers and stored procedures to enforce data integrity
- Performed indexing analysis and query optimization

### Backend Development
- Built RESTful API endpoints using Node.js and Express
- Implemented CRUD operations with proper error handling
- Integrated database access using Prisma ORM
- Managed authentication flows and protected routes

### Full-Stack Integration
- Connected frontend components to backend APIs
- Debugged CORS, environment variable, and deployment issues
- Ensured consistency between frontend state and database records

### External Data Integration
- Integrated third-party data sources (e.g., weather or plant metadata)
- Parsed and stored external data for use in application logic

---

## Technical Highlights

- Designed and queried a multi-table relational database with foreign key constraints
- Used SQL triggers and stored procedures to enforce business rules at the database layer
- Built a production-style backend API with authentication and validation
- Deployed a cloud-hosted MySQL instance and connected it to a live backend
- Debugged real-world issues involving CORS, environment configuration, and schema migrations

---

## Technologies Used

- **Languages:** JavaScript, SQL
- **Frontend:** React, Vite
- **Backend:** Node.js, Express
- **Database:** MySQL, Prisma ORM
- **Cloud:** Google Cloud SQL
- **Tools:** Git, REST APIs

---

## What I Learned

This project strengthened my understanding of:
- Designing relational databases for real applications
- Writing efficient SQL queries and enforcing constraints at the database level
- Building and debugging full-stack applications
- Managing cloud-hosted databases and environment configuration
- Coordinating frontend and backend development in a team setting

---

## Notes

This repository represents the project state at the conclusion of the course.  
Future enhancements could include recommendation systems, expanded analytics, and improved UI/UX features.
