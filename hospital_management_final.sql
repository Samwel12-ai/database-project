
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    Name VARCHAR(100),
    Description VARCHAR(255)
);

CREATE TABLE Doctors (
    DoctorID INT PRIMARY KEY,
    Name VARCHAR(100),
    Specialization VARCHAR(100),
    Phone VARCHAR(20),
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

CREATE TABLE Patients (
    PatientID INT PRIMARY KEY,
    Name VARCHAR(100),
    Gender VARCHAR(10),
    BirthDate DATE,
    Phone VARCHAR(20)
);

CREATE TABLE Rooms (
    RoomID INT PRIMARY KEY,
    RoomType VARCHAR(50),
    Availability VARCHAR(10)
);

CREATE TABLE Appointments (
    AppointmentID INT PRIMARY KEY,
    PatientID INT,
    DoctorID INT,
    Date DATE,
    Time TIME,
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID)
);

CREATE TABLE Admissions (
    AdmissionID INT PRIMARY KEY,
    PatientID INT,
    RoomID INT,
    AdmissionDate DATE,
    DischargeDate DATE,
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (RoomID) REFERENCES Rooms(RoomID)
);

INSERT INTO Departments VALUES
(1, 'Cardiology', 'Heart treatment department'),
(2, 'Neurology', 'Brain and nerves department'),
(3, 'Orthopedics', 'Bone treatment department'),
(4, 'Dermatology', 'Skin treatment department'),
(5, 'Pediatrics', 'Children health department'),
(6, 'Oncology', 'Cancer treatment department'),
(7, 'Ophthalmology', 'Eye treatment department'),
(8, 'Psychiatry', 'Mental health department'),
(9, 'ENT', 'Ear, Nose, and Throat department'),
(10, 'Urology', 'Urinary system department');

INSERT INTO Doctors VALUES
(1, 'Dr. Ahmed Ali', 'Cardiology', '01012345678', 1),
(2, 'Dr. Sara Nabil', 'Neurology', '01098765432', 2),
(3, 'Dr. Mona Samir', 'Orthopedics', '01123456789', 3),
(4, 'Dr. Karim Youssef', 'Dermatology', '01022334455', 4),
(5, 'Dr. Yara Sameh', 'Pediatrics', '01155667788', 5),
(6, 'Dr. Amr Mahmoud', 'Oncology', '01211223344', 6),
(7, 'Dr. Dina Ehab', 'Ophthalmology', '01099887766', 7),
(8, 'Dr. Nader Fathy', 'Psychiatry', '01144332211', 8),
(9, 'Dr. Laila Sherif', 'ENT', '01234567890', 9),
(10, 'Dr. Wael Gamal', 'Urology', '01066778899', 10);

INSERT INTO Patients VALUES
(1, 'Mohamed Yasser', 'Male', '1995-05-10', '01055551234'),
(2, 'Noura Adel', 'Female', '1988-11-20', '01066662345'),
(3, 'Hany Essam', 'Male', '2000-03-15', '01177773456'),
(4, 'Salma Hany', 'Female', '1993-02-22', '01099991111'),
(5, 'Omar Sherif', 'Male', '1985-06-30', '01188882222'),
(6, 'Aya Nader', 'Female', '1999-09-09', '01033334444'),
(7, 'Mostafa Saeed', 'Male', '1978-12-05', '01222225555'),
(8, 'Reem Tamer', 'Female', '2002-07-19', '01011112222'),
(9, 'Khaled Fathy', 'Male', '1990-04-17', '01166667777'),
(10, 'Lina Mostafa', 'Female', '1996-01-01', '01211113333');

INSERT INTO Rooms VALUES
(1, 'ICU', 'Available'),
(2, 'General', 'Occupied'),
(3, 'ICU', 'Occupied'),
(4, 'General', 'Available'),
(5, 'ICU', 'Available'),
(6, 'General', 'Occupied'),
(7, 'ICU', 'Available'),
(8, 'General', 'Occupied'),
(9, 'ICU', 'Available'),
(10, 'General', 'Available');

INSERT INTO Appointments VALUES
(1, 1, 1, '2025-05-14', '09:00:00'),
(2, 2, 2, '2025-05-15', '11:30:00'),
(3, 3, 3, '2025-05-16', '10:00:00'),
(4, 4, 4, '2025-05-17', '12:00:00'),
(5, 5, 5, '2025-05-18', '13:30:00'),
(6, 6, 6, '2025-05-19', '15:00:00'),
(7, 7, 7, '2025-05-20', '10:30:00'),
(8, 8, 8, '2025-05-21', '11:00:00'),
(9, 9, 9, '2025-05-22', '14:00:00'),
(10, 10, 10, '2025-05-23', '16:00:00');


INSERT INTO Admissions VALUES
(1, 1, 1, '2025-05-10', NULL),
(2, 2, 2, '2025-05-08', '2025-05-13'),
(3, 3, 3, '2025-05-12', NULL),
(4, 4, 4, '2025-05-09', '2025-05-11'),
(5, 5, 5, '2025-05-13', NULL),
(6, 6, 6, '2025-05-14', NULL),
(7, 7, 7, '2025-05-15', NULL),
(8, 8, 8, '2025-05-11', '2025-05-12'),
(9, 9, 9, '2025-05-10', NULL),
(10, 10, 10, '2025-05-16', NULL);

SELECT *
FROM Patients;

SELECT * 
FROM Rooms 
WHERE Availability = 'Available';

SELECT A.Date, A.Time, P.Name
FROM Appointments A
JOIN Patients P ON A.PatientID = P.PatientID
WHERE A.DoctorID = 1;

SELECT COUNT(*) 
FROM Admissions
WHERE DischargeDate IS NULL;

SELECT P.Name
FROM Admissions A
JOIN Patients P ON A.PatientID = P.PatientID
JOIN Rooms R ON A.RoomID = R.RoomID
WHERE R.RoomType = 'ICU';
