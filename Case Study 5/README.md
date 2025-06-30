# 🏥 Hospital Management System

A centralized healthcare platform to streamline hospital operations, including appointments, medical records, doctor and staff management, billing, pharmacy inventory, and emergency services.

---

## 📌 Purpose

To build a digital hospital ecosystem where:
- **Patients** can register, book appointments, and access their health records.
- **Doctors/Nurses** manage treatment workflows and electronic medical records.
- **Admins/Receptionists** oversee hospital operations, billing, and staff assignments.

---

## 👥 Roles

- **Patient**
- **Doctor**
- **Admin**
- **Receptionist / Nurse**

---

## 🔐 Module 1: User Registration & Profile Management

### 1.1 Login and Profile Handling
- **Use Case**: Register and manage user profiles
- **Actors**: Patient, Doctor, Admin
- **CRUD**:
  - `Create`: Register new patients/staff
  - `Read`: View personal/staff profile details
  - `Update`: Edit address, contact, specialization
  - `Delete`: Soft delete profile on deactivation

### 1.2 Change Password / Security Settings
- **Actors**: All Roles
- **CRUD**:
  - `Create`: Set initial password
  - `Read`: Fetch password history
  - `Update`: Change password
  - `Delete`: Clear expired sessions/tokens

---

## 📅 Module 2: Appointment Booking & Scheduling

### 2.1 Book & Manage Appointments
- **Use Case**: Patients book appointments; doctors check schedules
- **Actors**: Patient, Receptionist, Doctor
- **CRUD**:
  - `Create`: Schedule new appointment
  - `Read`: View daily/weekly schedule
  - `Update`: Reschedule or reassign doctor
  - `Delete`: Cancel appointment

---

## 🧾 Module 3: Patient Medical Records (EMR)

### 3.1 Maintain Electronic Medical Records
- **Use Case**: Store and update medical history
- **Actors**: Doctor, Nurse
- **CRUD**:
  - `Create`: Add visit notes, vitals, prescriptions
  - `Read`: View patient history and lab results
  - `Update`: Append follow-ups or test results
  - `Delete`: Archive old/incomplete records

---

## 🧑‍⚕️ Module 4: Doctor & Department Management

### 4.1 Manage Doctors & Staff
- **Use Case**: Add or modify hospital staff
- **Actors**: Admin
- **CRUD**:
  - `Create`: Register doctors and assign departments
  - `Read`: Filter by specialization or availability
  - `Update`: Change shift or department
  - `Delete`: Remove/transfer staff on resignation

---

## 💊 Module 5: Medicine & Inventory Management

### 5.1 Pharmacy Inventory Management
- **Use Case**: Track medicine availability
- **Actors**: Pharmacist, Admin
- **CRUD**:
  - `Create`: Add new stock with batch & expiry
  - `Read`: View stock levels or expiring meds
  - `Update`: Adjust inventory after dispensing
  - `Delete`: Remove expired/discontinued items

---

## 💵 Module 6: Billing & Payments

### 6.1 Generate and Manage Bills
- **Use Case**: Invoices for consultations, labs, and medicines
- **Actors**: Receptionist, Admin
- **CRUD**:
  - `Create`: Generate bill for patient services
  - `Read`: View/download invoices
  - `Update`: Add charges, apply discounts
  - `Delete`: Cancel bill before payment

---

## ✅ Bonus Modules (Optional)

| Module            | Use Case              | Actor       | Description                                    |
|-------------------|-----------------------|-------------|------------------------------------------------|
| Lab Management     | Schedule Lab Tests    | Nurse       | Test assignment and result entry               |
| Room Allotment     | Assign Beds/Rooms     | Admin       | ICU, General, Private rooms management         |
| Notifications      | Alerts/Reminders      | System      | Email/SMS for appointments & prescriptions     |
| Emergency Alerts   | Ambulance & ER Flow   | System      | ER-specific workflows & ambulance coordination |

---

## 🧰 Suggested Tech Stack

### Frontend
- React.js / Angular

### Backend
- Spring Boot / Node.js

### Database
- MySQL / PostgreSQL

### Cloud & Services
- **AWS EC2**: Backend deployment  
- **S3**: Medical reports and document uploads  
- **SES**: Email communication and appointment reminders

### Security
- OAuth2 / JWT
- Role-Based Access Control (RBAC)
- Encrypted data for health record protection

---

## 📁 Suggested Project Structure

```bash
hospital-management-system/
├── backend/
│ ├── controllers/
│ ├── routes/
│ ├── services/
│ └── models/
├── frontend/
│ ├── src/
│ │ ├── components/
│ │ ├── pages/
│ │ └── services/
├── reports/
├── scripts/
│ └── seed/
└── README.md
```

---