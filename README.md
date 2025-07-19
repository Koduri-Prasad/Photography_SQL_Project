
# Photography Studio Management System - SQL Project

This project is a **SQL-based database system** designed to manage photography studio operations such as customer bookings, shoot types, photographers, and assignments. It's perfect for hands-on learning of **SQL joins** and practicing complex queries.

---

##  Technologies Used

- 💾 **MySQL**  
- 📄 Raw SQL Queries  
- 🔗 Joins: INNER, LEFT, RIGHT, FULL (UNION), SELF JOIN

---

## Database Design Overview

The system consists of the following tables:
- **Customers** – Stores client info
- **Shoot_Types** – Wedding, Pre-Wedding, Portfolio, Baby, etc.
- **Bookings** – Booking info including date and status
- **Photographers** – Photographer details with experience and specialization
- **Shoot_Assignments** – Mapping bookings with photographers

---

##  Key SQL Features Practiced

- ✅ INNER JOIN queries to combine bookings with customer and shoot details  
- ✅ LEFT JOINs to show unmatched records (e.g., unassigned photographers)  
- ✅ RIGHT JOINs for reverse unmatched data  
- ✅ FULL JOIN simulated using `UNION`  
- ✅ SELF JOIN to compare photographers with same experience  
- ✅ GROUP BY with `COUNT()` and `HAVING`  
- ✅ Filtering with `WHERE` clauses

---

## Resume Usage

You can include this project in your resume under **SQL Projects**:
```
• Built a Photography Studio Management System using MySQL.
• Designed tables, inserted data, and performed advanced SQL joins (INNER, LEFT, RIGHT, FULL, SELF).
• Simulated real-world business scenarios like customer bookings and shoot assignments.
```

---

##  File Structure

```
Photography_SQL_Project/
├── queries.sql          # Contains all table definitions, insertions, and join queries
└── README.md            # Project overview and usage
```

---

## ✅ How to Run

You can run these SQL queries using:
- MySQL Workbench
- phpMyAdmin
- VS Code with SQL extensions
- Online SQL compilers (like SQL Fiddle)

---

## Author

Made by [KoduriPrasad]  
GitHub: [github.com/KoduriPrasad](https://github.com/Koduri-Prasad/Photography_SQL_Project))
