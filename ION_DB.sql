Create database ion_broadband;
use ion_broadband;

-- Plans
CREATE TABLE Plans (
    plan_id INT PRIMARY KEY,
    plan_name VARCHAR(50) NOT NULL,
    speed INT , -- in Mbps
    data_limit INT , -- in GB
    price DECIMAL(10, 2) NOT NULL,
    duration INT  -- in days
);

-- Users
CREATE TABLE Users (
    user_id INT PRIMARY KEY,
    full_name VARCHAR(100) ,
    email VARCHAR(100)  ,
    phone bigint,
    address VARCHAR(255),
    registration_date DATE,
    plan_id INT,
    FOREIGN KEY (plan_id) REFERENCES Plans(plan_id)
);

-- Subscriptions
CREATE TABLE Subscriptions (
    subscription_id INT PRIMARY KEY,
    user_id INT,
    plan_id INT,
    start_date DATE ,
    end_date DATE ,
    status VARCHAR(20) , -- e.g., Active, Expired, Cancelled
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (plan_id) REFERENCES Plans(plan_id)
);

-- UsageHistory
CREATE TABLE UsageHistory (
    usage_h_id INT PRIMARY KEY,
    user_id INT,
    date DATE ,
    data_used FLOAT , -- in GB
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

-- Invoice
CREATE TABLE Invoice (
    invoice_id INT PRIMARY KEY,
    subscription_id INT,
    invoice_date DATE ,
    due_date DATE ,
    amount DECIMAL(10, 2) ,
    status VARCHAR(20) , -- e.g., Paid, Unpaid, Overdue
    FOREIGN KEY (subscription_id) REFERENCES Subscriptions(subscription_id)
);

-- SupportTickets
CREATE TABLE SupportTickets (
    ticket_id INT PRIMARY KEY,
    user_id INT,
    issue_description TEXT ,
    status VARCHAR(20) , -- e.g., Open, In Progress, Closed
    created_date DATE ,
    resolved_date DATE,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

-- Payments
CREATE TABLE Payments (
    payment_id INT PRIMARY KEY,
    invoice_id INT,
    amount DECIMAL(10, 2) ,
    payment_date DATE ,
    payment_method VARCHAR(20) , -- e.g., UPI, Bank Transfer
    status VARCHAR(20) , -- e.g., Completed, Failed
    FOREIGN KEY (invoice_id) REFERENCES Invoice(invoice_id)
);

-- Technicians
CREATE TABLE Technicians (
    technician_id INT PRIMARY KEY,
    full_name VARCHAR(100) ,
    contact_number VARCHAR(20),
    email VARCHAR(100)  ,
    area_served VARCHAR(50)
);

-- ServiceAppointments
CREATE TABLE ServiceAppointments (
    appointment_id INT PRIMARY KEY,
    user_id INT,
    technician_id INT,
    service_date DATE ,
    service_type VARCHAR(50) , -- e.g., Installation, Maintenance
    status VARCHAR(20) , -- e.g., Scheduled, Completed, Cancelled
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (technician_id) REFERENCES Technicians(technician_id)
);

-- Billing
CREATE TABLE Billing (
    bill_id INT PRIMARY KEY,
    user_id INT,
    subscription_id INT,
    billing_period_start DATE ,
    billing_period_end DATE ,
    total_amount DECIMAL(10, 2) ,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (subscription_id) REFERENCES Subscriptions(subscription_id)
);

-- Notifications
CREATE TABLE Notifications (
    notification_id INT PRIMARY KEY,
    user_id INT,
    message TEXT ,
    notification_date DATE ,
    status VARCHAR(20)  -- e.g., Sent, Read
);


-- Select
select * from Users;
select * from Plans;
select * from Subscriptions;
select * from UsageHistory;
select * from Invoice;
select * from SupportTickets;
select * from Payments;
select * from Technicians;
select * from ServiceAppointments;
select * from Billing;
select * from Notifications;

-- Desc
desc Users;
desc Plans;
desc Subscriptions;
desc UserEngagement;
desc Invoice;
desc SupportTickets;
desc Payments;
desc Technicians;
desc ServiceAppointments;
desc Billing;
desc Notifications;


INSERT INTO Users (user_id, full_name, email, phone, address, registration_date, plan_id)
VALUES 
    (1, 'Rohan Sharma', 'rohan.sharma@example.com', '9876543210', '101 MG Road, Mumbai', '2024-01-15', 12),
    (2, 'Priya Verma', 'priya.verma@example.com', '9876543211', '202, Lajpat Nagar, Delhi', '2024-02-20', 27),
    (3, 'Suresh Kumar', 'suresh.kumar@example.com', '9876543212', '305, Park Street, Kolkata', '2024-03-10', 5),
    (4, 'Anita Desai', 'anita.desai@example.com', '9876543216', '505, Churchgate, Mumbai', '2024-04-01', 18),
    (5, 'Vikram Singh', 'vikram.singh@example.com', '9876543217', '110, Sector 5, Noida', '2024-04-15', 2),
    (6, 'Deepa Nair', 'deepa.nair@example.com', '9876543218', '402, JP Nagar, Bangalore', '2024-05-10', 14),
    (7, 'Arjun Patel', 'arjun.patel@example.com', '9876543219', '309, Satellite, Ahmedabad', '2024-05-20', 30),
    (8, 'Suman Roy', 'suman.roy@example.com', '9876543220', '808, Salt Lake, Kolkata', '2024-06-01', 9),
    (9, 'Ritika Joshi', 'ritika.joshi@example.com', '9876543221', '123, MG Road, Mumbai', '2024-06-15', 21),
    (10, 'Rahul Mehta', 'rahul.mehta@example.com', '9876543222', '456, Lajpat Nagar, Delhi', '2024-06-20', 11),
    (11, 'Nisha Singh', 'nisha.singh@example.com', '9876543223', '789, Park Street, Kolkata', '2024-07-01', 24),
    (12, 'Vivek Gupta', 'vivek.gupta@example.com', '9876543224', '101, Churchgate, Mumbai', '2024-07-10', 4),
    (13, 'Anjali Reddy', 'anjali.reddy@example.com', '9876543225', '202, Sector 5, Noida', '2024-07-15', 15),
    (14, 'Kiran Roy', 'kiran.roy@example.com', '9876543226', '303, JP Nagar, Bangalore', '2024-08-01', 8),
    (15, 'Pooja Mehta', 'pooja.mehta@example.com', '9876543227', '404, Satellite, Ahmedabad', '2024-08-10', 3),
    (16, 'Sandeep Sharma', 'sandeep.sharma@example.com', '9876543228', '505, MG Road, Mumbai', '2024-08-20', 13),
    (17, 'Tanya Choudhary', 'tanya.choudhary@example.com', '9876543229', '606, Lajpat Nagar, Delhi', '2024-08-25', 22),
    (18, 'Arvind Kumar', 'arvind.kumar@example.com', '9876543230', '707, Park Street, Kolkata', '2024-09-01', 6),
    (19, 'Sneha Sharma', 'sneha.sharma@example.com', '9876543231', '808, Churchgate, Mumbai', '2024-09-10', 19),
    (20, 'Vikrant Soni', 'vikrant.soni@example.com', '9876543232', '909, Sector 5, Noida', '2024-09-15', 29),
    (21, 'Lakshmi Nair', 'lakshmi.nair@example.com', '9876543233', '1010, JP Nagar, Bangalore', '2024-09-20', 1),
    (22, 'Raghav Singh', 'raghav.singh@example.com', '9876543234', '1111, Satellite, Ahmedabad', '2024-10-01', 20),
    (23, 'Kavita Verma', 'kavita.verma@example.com', '9876543235', '1212, MG Road, Mumbai', '2024-10-10', 7),
    (24, 'Rajeev Kumar', 'rajeeve.kumar@example.com', '9876543236', '1313, Lajpat Nagar, Delhi', '2024-10-15', 26),
    (25, 'Neha Joshi', 'neha.joshi@example.com', '9876543237', '1414, Park Street, Kolkata', '2024-10-20', 10),
    (26, 'Siddharth Rao', 'siddharth.rao@example.com', '9876543238', '1515, Churchgate, Mumbai', '2024-11-01', 12),
    (27, 'Geeta Verma', 'geeta.verma@example.com', '9876543239', '1616, Sector 5, Noida', '2024-11-10', 25),
    (28, 'Kumar Sinha', 'kumar.sinha@example.com', '9876543240', '1717, JP Nagar, Bangalore', '2024-11-15', 28),
    (29, 'Sheetal Sharma', 'sheetal.sharma@example.com', '9876543241', '1818, Satellite, Ahmedabad', '2024-12-01', 23),
    (30, 'Nitin Agarwal', 'nitin.agarwal@example.com', '9876543242', '1919, MG Road, Mumbai', '2024-12-10', 17),
    (31, 'Swati Patel', 'swati.patel@example.com', '9876543243', '2020, Lajpat Nagar, Delhi', '2024-12-15', 16),
    (32, 'Ramesh Yadav', 'ramesh.yadav@example.com', '9876543244', '2121, Park Street, Kolkata', '2025-01-01', 30),
    (33, 'Pankaj Mishra', 'pankaj.mishra@example.com', '9876543245', '2222, Churchgate, Mumbai', '2025-01-10', 15),
    (34, 'Tanvi Kapoor', 'tanvi.kapoor@example.com', '9876543246', '2323, Sector 5, Noida', '2025-01-15', 14),
    (35, 'Raj Kumar', 'raj.kumar@example.com', '9876543247', '2424, JP Nagar, Bangalore', '2025-02-01', 11),
    (36, 'Arushi Verma', 'arushi.verma@example.com', '9876543248', '2525, Satellite, Ahmedabad', '2025-02-10', 9),
    (37, 'Devendra Choudhary', 'devendra.choudhary@example.com', '9876543249', '2626, MG Road, Mumbai', '2025-02-15', 6),
    (38, 'Shivani Gupta', 'shivani.gupta@example.com', '9876543250', '2727, Lajpat Nagar, Delhi', '2025-02-20', 2),
    (39, 'Ritika Singh', 'ritika.singh@example.com', '9876543251', '2828, Park Street, Kolkata', '2025-03-01', 18),
    (40, 'Rajiv Rathi', 'rajiv.rathi@example.com', '9876543252', '2929, Churchgate, Mumbai', '2025-03-10', 13),
    (41, 'Mohan Bhatia', 'mohan.bhatia@example.com', '9876543253', '3030, Sector 5, Noida', '2025-03-15', 3),
    (42, 'Sanjay Tiwari', 'sanjay.tiwari@example.com', '9876543254', '3131, JP Nagar, Bangalore', '2025-04-01', 19),
    (43, 'Seema Agarwal', 'seema.agarwal@example.com', '9876543255', '3232, Satellite, Ahmedabad', '2025-04-10', 25),
    (44, 'Ankit Joshi', 'ankit.joshi@example.com', '9876543256', '3333, MG Road, Mumbai', '2025-04-15', 7),
    (45, 'Pallavi Rao', 'pallavi.rao@example.com', '9876543257', '3434, Lajpat Nagar, Delhi', '2025-05-01', 20),
    (46, 'Vishal Sharma', 'vishal.sharma@example.com', '9876543258', '3535, Park Street, Kolkata', '2025-05-10', 26),
    (47, 'Karan Sinha', 'karan.sinha@example.com', '9876543259', '3636, Churchgate, Mumbai', '2025-05-15', 5),
    (48, 'Rekha Mehta', 'rekha.mehta@example.com', '9876543260', '3737, Sector 5, Noida', '2025-06-01', 29),
    (49, 'Uday Sharma', 'uday.sharma@example.com', '9876543261', '3838, JP Nagar, Bangalore', '2025-06-10', 17),
    (50, 'Kavya Nair', 'kavya.nair@example.com', '9876543262', '3939, Satellite, Ahmedabad', '2025-06-15', 23),
    (51, 'Isha Malik', 'isha.malik@example.com', '9876543263', '4040, MG Road, Mumbai', '2025-06-15', 1),
    (52, 'Sanjana Kapoor', 'sanjana.kapoor@example.com', '9876543264', '4141, Lajpat Nagar, Delhi', '2025-06-20', 2),
    (53, 'Amir Khan', 'amir.khan@example.com', '9876543265', '4242, Park Street, Kolkata', '2025-07-01', 3),
    (54, 'Geeta Sharma', 'geeta.sharma@example.com', '9876543266', '4343, Churchgate, Mumbai', '2025-07-10', 2),
    (55, 'Anil Gupta', 'anil.gupta@example.com', '9876543267', '4444, Sector 5, Noida', '2025-07-15', 1),
    (56, 'Simran Kaur', 'simran.kaur@example.com', '9876543268', '4545, JP Nagar, Bangalore', '2025-08-01', 3),
    (57, 'Uday Rathi', 'uday.rathi@example.com', '9876543269', '4646, Satellite, Ahmedabad', '2025-08-10', 2),
    (58, 'Neelam Bhatia', 'neelam.bhatia@example.com', '9876543270', '4747, MG Road, Mumbai', '2025-08-15', 1),
    (59, 'Kartik Yadav', 'kartik.yadav@example.com', '9876543271', '4848, Lajpat Nagar, Delhi', '2025-09-01', 3),
    (60, 'Hina Mehta', 'hina.mehta@example.com', '9876543272', '4949, Park Street, Kolkata', '2025-09-10', 2),
    (61, 'Rakesh Jain', 'rakesh.jain@example.com', '9876543273', '5050, Churchgate, Mumbai', '2025-09-15', 1),
    (62, 'Tina Sharma', 'tina.sharma@example.com', '9876543274', '5151, Sector 5, Noida', '2025-09-20', 3),
    (63, 'Ankur Verma', 'ankur.verma@example.com', '9876543275', '5252, JP Nagar, Bangalore', '2025-10-01', 2),
    (64, 'Tanushree Ghosh', 'tanushree.ghosh@example.com', '9876543276', '5353, Satellite, Ahmedabad', '2025-10-10', 1),
    (65, 'Rupesh Choudhary', 'rupesh.choudhary@example.com', '9876543277', '5454, MG Road, Mumbai', '2025-10-15', 2),
    (66, 'Gaurav Patil', 'gaurav.patil@example.com', '9876543278', '5555, Lajpat Nagar, Delhi', '2025-11-01', 3),
    (67, 'Neeraj Agarwal', 'neeraj.agarwal@example.com', '9876543279', '5656, Park Street, Kolkata', '2025-11-10', 2),
    (68, 'Aditi Sinha', 'aditi.sinha@example.com', '9876543280', '5757, Churchgate, Mumbai', '2025-11-15', 1),
    (69, 'Prateek Kumar', 'prateek.kumar@example.com', '9876543281', '5858, Sector 5, Noida', '2025-12-01', 3),
    (70, 'Vaishali Sharma', 'vaishali.sharma@example.com', '9876543282', '5959, JP Nagar, Bangalore', '2025-12-10', 2),
    (71, 'Rohan Rathi', 'rohan.rathi@example.com', '9876543283', '6060, Satellite, Ahmedabad', '2025-12-15', 1),
    (72, 'Sonal Tiwari', 'sonal.tiwari@example.com', '9876543284', '6161, MG Road, Mumbai', '2026-01-01', 3),
    (73, 'Navin Yadav', 'navin.yadav@example.com', '9876543285', '6262, Lajpat Nagar, Delhi', '2026-01-10', 2),
    (74, 'Neha Soni', 'neha.soni@example.com', '9876543286', '6363, Park Street, Kolkata', '2026-01-15', 1),
    (75, 'Rakesh Sharma', 'rakesh.sharma@example.com', '9876543287', '6464, Churchgate, Mumbai', '2026-02-01', 3),
    (76, 'Gulshan Singh', 'gulshan.singh@example.com', '9876543288', '6565, Sector 5, Noida', '2026-02-10', 2),
    (77, 'Kiran Verma', 'kiran.verma@example.com', '9876543289', '6666, JP Nagar, Bangalore', '2026-02-15', 1),
    (78, 'Dev Kumar', 'dev.kumar@example.com', '9876543290', '6767, Satellite, Ahmedabad', '2026-03-01', 3),
    (79, 'Maya Sharma', 'maya.sharma@example.com', '9876543291', '6868, MG Road, Mumbai', '2026-03-10', 2),
    (80, 'Anil Yadav', 'anil.yadav@example.com', '9876543292', '6969, Lajpat Nagar, Delhi', '2026-03-15', 1),
    (81, 'Himanshu Patil', 'himanshu.patil@example.com', '9876543293', '7070, Park Street, Kolkata', '2026-04-01', 3),
    (82, 'Vaishali Verma', 'vaishali.verma@example.com', '9876543294', '7171, Churchgate, Mumbai', '2026-04-10', 2),
    (83, 'Rajesh Gupta', 'rajesh.gupta@example.com', '9876543295', '7272, Sector 5, Noida', '2026-04-15', 1),
    (84, 'Vasudha Singh', 'vasudha.singh@example.com', '9876543296', '7373, JP Nagar, Bangalore', '2026-05-01', 3),
    (85, 'Deepak Rao', 'deepak.rao@example.com', '9876543297', '7474, Satellite, Ahmedabad', '2026-05-10', 2),
    (86, 'Nidhi Verma', 'nidhi.verma@example.com', '9876543298', '7575, MG Road, Mumbai', '2026-05-15', 1),
    (87, 'Gaurav Choudhary', 'gaurav.choudhary@example.com', '9876543299', '7676, Lajpat Nagar, Delhi', '2026-06-01', 3),
    (88, 'Priya Agarwal', 'priya.agarwal@example.com', '9876543300', '7777, Park Street, Kolkata', '2026-06-10', 2),
    (89, 'Rahul Bhatia', 'rahul.bhatia@example.com', '9876543301', '7878, Churchgate, Mumbai', '2026-06-15', 1),
    (90, 'Sonali Desai', 'sonali.desai@example.com', '9876543302', '7979, Sector 5, Noida', '2026-06-20', 3),
    (91, 'Rohit Rathi', 'rohit.rathi@example.com', '9876543303', '8080, JP Nagar, Bangalore', '2026-07-01', 2),
    (92, 'Suman Soni', 'suman.soni@example.com', '9876543304', '8181, Satellite, Ahmedabad', '2026-07-10', 1),
    (93, 'Vivek Sharma', 'vivek.sharma@example.com', '9876543305', '8282, MG Road, Mumbai', '2026-07-15', 3),
    (94, 'Nisha Agarwal', 'nisha.agarwal@example.com', '9876543306', '8383, Lajpat Nagar, Delhi', '2026-08-01', 2),
    (95, 'Shreyas Patil', 'shreyas.patil@example.com', '9876543307', '8484, Park Street, Kolkata', '2026-08-10', 1),
    (96, 'Pooja Choudhary', 'pooja.choudhary@example.com', '9876543308', '8585, Churchgate, Mumbai', '2026-08-15', 3),
    (97, 'Ankur Joshi', 'ankur.joshi@example.com', '9876543309', '8686, Sector 5, Noida', '2026-09-01', 2),
    (98, 'Tanya Sharma', 'tanya.sharma@example.com', '9876543310', '8787, JP Nagar, Bangalore', '2026-09-10', 1),
    (99, 'Rajesh Yadav', 'rajesh.yadav@example.com', '9876543311', '8888, Satellite, Ahmedabad', '2026-09-15', 3),
    (100, 'Nisha Rathi', 'nisha.rathi@example.com', '9876543312', '8989, MG Road, Mumbai', '2026-10-01', 2),
    (101, 'Kunal Singh', 'kunal.singh@example.com', '9876543313', '9090, Lajpat Nagar, Delhi', '2026-10-10', 7),
    (102, 'Alok Yadav', 'alok.yadav@example.com', '9876543314', '9191, Park Street, Kolkata', '2026-10-15', 14),
    (103, 'Rita Sharma', 'rita.sharma@example.com', '9876543315', '9292, Churchgate, Mumbai', '2026-11-01', 2),
    (104, 'Meena Ghosh', 'meena.ghosh@example.com', '9876543316', '9393, Sector 5, Noida', '2026-11-10', 29),
    (105, 'Kiran Patil', 'kiran.patil@example.com', '9876543317', '9494, JP Nagar, Bangalore', '2026-11-15', 12),
    (106, 'Sonu Verma', 'sonu.verma@example.com', '9876543318', '9595, Satellite, Ahmedabad', '2026-12-01', 22),
    (107, 'Alok Kumar', 'alok.kumar@example.com', '9876543319', '9696, MG Road, Mumbai', '2026-12-10', 5),
    (108, 'Neha Sharma', 'neha.sharma@example.com', '9876543320', '9797, Lajpat Nagar, Delhi', '2026-12-15', 18),
    (109, 'Rahul Gupta', 'rahul.gupta@example.com', '9876543321', '9898, Park Street, Kolkata', '2027-01-01', 3),
    (110, 'Amit Patil', 'amit.patil@example.com', '9876543322', '9999, Churchgate, Mumbai', '2027-01-10', 21),
    (111, 'Vikash Kumar', 'vikash.kumar@example.com', '9876543323', '10101, Sector 5, Noida', '2027-01-15', 11),
    (112, 'Tanisha Rathi', 'tanisha.rathi@example.com', '9876543324', '11111, JP Nagar, Bangalore', '2027-02-01', 4),
    (113, 'Jitendra Verma', 'jitendra.verma@example.com', '9876543325', '12121, Satellite, Ahmedabad', '2027-02-10', 8),
    (114, 'Siddharth Desai', 'siddharth.desai@example.com', '9876543326', '13131, MG Road, Mumbai', '2027-02-15', 25),
    (115, 'Gaurav Agarwal', 'gaurav.agarwal@example.com', '9876543327', '14141, Lajpat Nagar, Delhi', '2027-03-01', 13),
    (116, 'Neelam Sharma', 'neelam.sharma@example.com', '9876543328', '15151, Park Street, Kolkata', '2027-03-10', 9),
    (117, 'Avinash Kumar', 'avinash.kumar@example.com', '9876543329', '16161, Churchgate, Mumbai', '2027-03-15', 27),
    (118, 'Vani Yadav', 'vani.yadav@example.com', '9876543330', '17171, Sector 5, Noida', '2027-04-01', 15),
    (119, 'Suraj Patil', 'suraj.patil@example.com', '9876543331', '18181, JP Nagar, Bangalore', '2027-04-10', 30),
    (120, 'Gaurav Rathi', 'gaurav.rathi@example.com', '9876543332', '19191, Satellite, Ahmedabad', '2027-04-15', 20),
    (121, 'Suman Yadav', 'suman.yadav@example.com', '9876543333', '20202, MG Road, Mumbai', '2027-05-01', 1),
    (122, 'Tanisha Singh', 'tanisha.singh@example.com', '9876543334', '21212, Lajpat Nagar, Delhi', '2027-05-10', 26),
    (123, 'Rajendra Patil', 'rajendra.patil@example.com', '9876543335', '22222, Park Street, Kolkata', '2027-05-15', 19),
    (124, 'Kartik Agarwal', 'kartik.agarwal@example.com', '9876543336', '23232, Churchgate, Mumbai', '2027-06-01', 10),
    (125, 'Aditi Rathi', 'aditi.rathi@example.com', '9876543337', '24242, Sector 5, Noida', '2027-06-10', 16),
    (126, 'Maya Sharma', 'maya.sharma@example.com', '9876543338', '25252, JP Nagar, Bangalore', '2027-06-15', 23),
    (127, 'Sidharth Jain', 'sidharth.jain@example.com', '9876543339', '26262, Satellite, Ahmedabad', '2027-07-01', 28),
    (128, 'Anjali Yadav', 'anjali.yadav@example.com', '9876543340', '27272, MG Road, Mumbai', '2027-07-10', 6),
    (129, 'Mohit Singh', 'mohit.singh@example.com', '9876543341', '28282, Lajpat Nagar, Delhi', '2027-07-15', 24),
    (130, 'Alok Desai', 'alok.desai@example.com', '9876543342', '29292, Park Street, Kolkata', '2027-08-01', 17),
    (131, 'Deepika Patel', 'deepika.patel@example.com', '9876543343', '30303, Churchgate, Mumbai', '2027-08-10', 1),
    (132, 'Ashish Verma', 'ashish.verma@example.com', '9876543344', '31313, Sector 5, Noida', '2027-08-15', 12),
    (133, 'Rani Gupta', 'rani.gupta@example.com', '9876543345', '32323, JP Nagar, Bangalore', '2027-09-01', 8),
    (134, 'Kamal Singh', 'kamal.singh@example.com', '9876543346', '33333, Satellite, Ahmedabad', '2027-09-10', 30),
    (135, 'Shivani Agarwal', 'shivani.agarwal@example.com', '9876543347', '34343, MG Road, Mumbai', '2027-09-15', 22),
    (136, 'Amit Kumar', 'amit.kumar@example.com', '9876543348', '35353, Lajpat Nagar, Delhi', '2027-10-01', 15),
    (137, 'Pallavi Yadav', 'pallavi.yadav@example.com', '9876543349', '36363, Park Street, Kolkata', '2027-10-10', 17),
    (138, 'Nikhil Patil', 'nikhil.patil@example.com', '9876543350', '37373, Churchgate, Mumbai', '2027-10-15', 5),
    (139, 'Sneha Sharma', 'sneha.sharma@example.com', '9876543351', '38383, Sector 5, Noida', '2027-11-01', 18),
    (140, 'Deepak Rathi', 'deepak.rathi@example.com', '9876543352', '39393, JP Nagar, Bangalore', '2027-11-10', 2),
    (141, 'Manisha Verma', 'manisha.verma@example.com', '9876543353', '40404, Satellite, Ahmedabad', '2027-11-15', 27),
    (142, 'Ravi Singh', 'ravi.singh@example.com', '9876543354', '41414, MG Road, Mumbai', '2027-12-01', 14),
    (143, 'Vinay Yadav', 'vinay.yadav@example.com', '9876543355', '42424, Lajpat Nagar, Delhi', '2027-12-10', 9),
    (144, 'Madhuri Patil', 'madhuri.patil@example.com', '9876543356', '43434, Park Street, Kolkata', '2027-12-15', 11),
    (145, 'Neha Jain', 'neha.jain@example.com', '9876543357', '44444, Churchgate, Mumbai', '2028-01-01', 19),
    (146, 'Suresh Gupta', 'suresh.gupta@example.com', '9876543358', '45454, Sector 5, Noida', '2028-01-10', 26),
    (147, 'Shreya Desai', 'shreya.desai@example.com', '9876543359', '46464, JP Nagar, Bangalore', '2028-01-15', 3),
    (148, 'Ajay Agarwal', 'ajay.agarwal@example.com', '9876543360', '47474, Satellite, Ahmedabad', '2028-02-01', 25),
    (149, 'Kavita Rathi', 'kavita.rathi@example.com', '9876543361', '48484, MG Road, Mumbai', '2028-02-10', 20),
    (150, 'Rajesh Kumar', 'rajesh.kumar@example.com', '9876543362', '49494, Lajpat Nagar, Delhi', '2028-02-15', 4),
    (151, 'Rajesh Khanna', 'rajesh.khanna@example.com', '9876543363', '50505, Park Street, Kolkata', '2028-03-01', 2),
    (152, 'Nandita Verma', 'nandita.verma@example.com', '9876543364', '51515, Churchgate, Mumbai', '2028-03-10', 1),
    (153, 'Sandeep Yadav', 'sandeep.yadav@example.com', '9876543365', '52525, Sector 5, Noida', '2028-03-15', 3),
    (154, 'Aarti Sharma', 'aarti.sharma@example.com', '9876543366', '53535, JP Nagar, Bangalore', '2028-04-01', 2),
    (155, 'Rajiv Rathi', 'rajiv.rathi@example.com', '9876543367', '54545, Satellite, Ahmedabad', '2028-04-10', 1),
    (156, 'Nisha Patel', 'nisha.patel@example.com', '9876543368', '55555, MG Road, Mumbai', '2028-04-15', 3),
    (157, 'Ritesh Kumar', 'ritesh.kumar@example.com', '9876543369', '56565, Lajpat Nagar, Delhi', '2028-05-01', 2),
    (158, 'Suman Desai', 'suman.desai@example.com', '9876543370', '57575, Park Street, Kolkata', '2028-05-10', 1),
    (159, 'Kiran Singh', 'kiran.singh@example.com', '9876543371', '58585, Churchgate, Mumbai', '2028-05-15', 3),
    (160, 'Amit Verma', 'amit.verma@example.com', '9876543372', '59595, Sector 5, Noida', '2028-06-01', 2),
    (161, 'Pooja Gupta', 'pooja.gupta@example.com', '9876543373', '60606, JP Nagar, Bangalore', '2028-06-10', 1),
    (162, 'Anil Yadav', 'anil.yadav@example.com', '9876543374', '61616, Satellite, Ahmedabad', '2028-06-15', 3),
    (163, 'Shivani Rathi', 'shivani.rathi@example.com', '9876543375', '62626, MG Road, Mumbai', '2028-07-01', 2),
    (164, 'Rajesh Agarwal', 'rajesh.agarwal@example.com', '9876543376', '63636, Lajpat Nagar, Delhi', '2028-07-10', 1),
    (165, 'Manoj Kumar', 'manoj.kumar@example.com', '9876543377', '64646, Park Street, Kolkata', '2028-07-15', 3),
    (166, 'Geeta Desai', 'geeta.desai@example.com', '9876543378', '65656, Churchgate, Mumbai', '2028-08-01', 2),
    (167, 'Sanjay Singh', 'sanjay.singh@example.com', '9876543379', '66666, Sector 5, Noida', '2028-08-10', 1),
    (168, 'Tanvi Sharma', 'tanvi.sharma@example.com', '9876543380', '67676, JP Nagar, Bangalore', '2028-08-15', 3),
    (169, 'Ajay Yadav', 'ajay.yadav@example.com', '9876543381', '68686, Satellite, Ahmedabad', '2028-09-01', 2),
    (170, 'Deepak Gupta', 'deepak.gupta@example.com', '9876543382', '69696, MG Road, Mumbai', '2028-09-10', 1),
    (171, 'Rani Rathi', 'rani.rathi@example.com', '9876543383', '70707, Lajpat Nagar, Delhi', '2028-09-15', 3),
    (172, 'Akash Patil', 'akash.patil@example.com', '9876543384', '71717, Park Street, Kolkata', '2028-10-01', 2),
    (173, 'Kavita Sharma', 'kavita.sharma@example.com', '9876543385', '72727, Churchgate, Mumbai', '2028-10-10', 1),
    (174, 'Rajendra Yadav', 'rajendra.yadav@example.com', '9876543386', '73737, Sector 5, Noida', '2028-10-15', 3),
    (175, 'Neha Rathi', 'neha.rathi@example.com', '9876543387', '74747, JP Nagar, Bangalore', '2028-11-01', 2),
    (176, 'Siddharth Singh', 'siddharth.singh@example.com', '9876543388', '75757, Satellite, Ahmedabad', '2028-11-10', 1),
    (177, 'Aditi Gupta', 'aditi.gupta@example.com', '9876543389', '76767, MG Road, Mumbai', '2028-11-15', 3),
    (178, 'Priti Desai', 'priti.desai@example.com', '9876543390', '77777, Lajpat Nagar, Delhi', '2028-12-01', 2),
    (179, 'Kiran Agarwal', 'kiran.agarwal@example.com', '9876543391', '78787, Park Street, Kolkata', '2028-12-10', 1),
    (180, 'Rajesh Sharma', 'rajesh.sharma@example.com', '9876543392', '79797, Churchgate, Mumbai', '2028-12-15', 3),
    (181, 'Tanisha Yadav', 'tanisha.yadav@example.com', '9876543393', '80808, Sector 5, Noida', '2029-01-01', 2),
    (182, 'Alok Kumar', 'alok.kumar@example.com', '9876543394', '81818, JP Nagar, Bangalore', '2029-01-10', 1),
    (183, 'Maya Patel', 'maya.patel@example.com', '9876543395', '82828, Satellite, Ahmedabad', '2029-01-15', 3),
    (184, 'Kavita Rathi', 'kavita.rathi@example.com', '9876543396', '83838, MG Road, Mumbai', '2029-02-01', 2),
    (185, 'Nitin Verma', 'nitin.verma@example.com', '9876543397', '84848, Lajpat Nagar, Delhi', '2029-02-10', 1),
    (186, 'Suman Yadav', 'suman.yadav@example.com', '9876543398', '85858, Park Street, Kolkata', '2029-02-15', 3),
    (187, 'Raj Kumar', 'raj.kumar@example.com', '9876543399', '86868, Churchgate, Mumbai', '2029-03-01', 2),
    (188, 'Anita Sharma', 'anita.sharma@example.com', '9876543400', '87878, Sector 5, Noida', '2029-03-10', 1),
    (189, 'Pankaj Desai', 'pankaj.desai@example.com', '9876543401', '88888, JP Nagar, Bangalore', '2029-03-15', 3),
    (190, 'Ravi Agarwal', 'ravi.agarwal@example.com', '9876543402', '89898, Satellite, Ahmedabad', '2029-04-01', 2),
    (191, 'Nikita Rathi', 'nikita.rathi@example.com', '9876543403', '90909, MG Road, Mumbai', '2029-04-10', 1),
    (192, 'Ajay Yadav', 'ajay.yadav@example.com', '9876543404', '91919, Lajpat Nagar, Delhi', '2029-04-15', 3),
    (193, 'Deepak Sharma', 'deepak.sharma@example.com', '9876543405', '92929, Park Street, Kolkata', '2029-05-01', 2),
    (194, 'Rita Verma', 'rita.verma@example.com', '9876543406', '93939, Churchgate, Mumbai', '2029-05-10', 1),
    (195, 'Aditi Yadav', 'aditi.yadav@example.com', '9876543407', '94949, Sector 5, Noida', '2029-05-15', 3),
    (196, 'Prakash Kumar', 'prakash.kumar@example.com', '9876543408', '95959, JP Nagar, Bangalore', '2029-06-01', 2),
    (197, 'Vivek Gupta', 'vivek.gupta@example.com', '9876543409', '96969, Satellite, Ahmedabad', '2029-06-10', 1),
    (198, 'Kiran Patel', 'kiran.patel@example.com', '9876543410', '97979, MG Road, Mumbai', '2029-06-15', 3),
    (199, 'Rohit Yadav', 'rohit.yadav@example.com', '9876543411', '98989, Lajpat Nagar, Delhi', '2029-07-01', 2),
    (200, 'Anjali Desai', 'anjali.desai@example.com', '9876543412', '99999, Park Street, Kolkata', '2029-07-10', 1),
    (201, 'Sunil Sharma', 'sunil.sharma@example.com', '9876543413', '10000, Churchgate, Mumbai', '2029-07-15', 17),
    (202, 'Deepali Rathi', 'deepali.rathi@example.com', '9876543414', '11111, Sector 5, Noida', '2029-08-01', 25),
    (203, 'Keshav Yadav', 'keshav.yadav@example.com', '9876543415', '12222, JP Nagar, Bangalore', '2029-08-10', 9),
    (204, 'Poonam Gupta', 'poonam.gupta@example.com', '9876543416', '13333, Satellite, Ahmedabad', '2029-08-15', 22),
    (205, 'Raghav Sharma', 'raghav.sharma@example.com', '9876543417', '14444, MG Road, Mumbai', '2029-09-01', 4),
    (206, 'Neelam Verma', 'neelam.verma@example.com', '9876543418', '15555, Lajpat Nagar, Delhi', '2029-09-10', 13),
    (207, 'Manik Yadav', 'manik.yadav@example.com', '9876543419', '16666, Park Street, Kolkata', '2029-09-15', 30),
    (208, 'Kamal Agarwal', 'kamal.agarwal@example.com', '9876543420', '17777, Churchgate, Mumbai', '2029-10-01', 7),
    (209, 'Tanya Sharma', 'tanya.sharma@example.com', '9876543421', '18888, Sector 5, Noida', '2029-10-10', 18),
    (210, 'Krishna Rathi', 'krishna.rathi@example.com', '9876543422', '19999, JP Nagar, Bangalore', '2029-10-15', 29),
    (211, 'Suraj Yadav', 'suraj.yadav@example.com', '9876543423', '20000, Satellite, Ahmedabad', '2029-11-01', 16),
    (212, 'Rani Gupta', 'rani.gupta@example.com', '9876543424', '21111, MG Road, Mumbai', '2029-11-10', 6),
    (213, 'Sunita Sharma', 'sunita.sharma@example.com', '9876543425', '22222, Lajpat Nagar, Delhi', '2029-11-15', 26),
    (214, 'Harsh Yadav', 'harsh.yadav@example.com', '9876543426', '23333, Park Street, Kolkata', '2030-01-01', 11),
    (215, 'Nikhil Agarwal', 'nikhil.agarwal@example.com', '9876543427', '24444, Churchgate, Mumbai', '2030-01-10', 19),
    (216, 'Kajal Verma', 'kajal.verma@example.com', '9876543428', '25555, Sector 5, Noida', '2030-01-15', 27),
    (217, 'Rakesh Rathi', 'rakesh.rathi@example.com', '9876543429', '26666, JP Nagar, Bangalore', '2030-02-01', 15),
    (218, 'Vinita Sharma', 'vinita.sharma@example.com', '9876543430', '27777, Satellite, Ahmedabad', '2030-02-10', 23),
    (219, 'Aman Yadav', 'aman.yadav@example.com', '9876543431', '28888, MG Road, Mumbai', '2030-02-15', 8),
    (220, 'Anupam Gupta', 'anupam.gupta@example.com', '9876543432', '29999, Lajpat Nagar, Delhi', '2030-03-01', 5),
    (221, 'Rachna Desai', 'rachna.desai@example.com', '9876543433', '30000, Park Street, Kolkata', '2030-03-10', 21),
    (222, 'Abhishek Rathi', 'abhishek.rathi@example.com', '9876543434', '31111, Churchgate, Mumbai', '2030-03-15', 2),
    (223, 'Seema Sharma', 'seema.sharma@example.com', '9876543435', '32222, Sector 5, Noida', '2030-04-01', 12),
    (224, 'Nitin Yadav', 'nitin.yadav@example.com', '9876543436', '33333, JP Nagar, Bangalore', '2030-04-10', 28),
    (225, 'Kavita Gupta', 'kavita.gupta@example.com', '9876543437', '34444, Satellite, Ahmedabad', '2030-04-15', 3),
    (226, 'Deepak Agarwal', 'deepak.agarwal@example.com', '9876543438', '35555, MG Road, Mumbai', '2030-05-01', 14),
    (227, 'Poonam Verma', 'poonam.verma@example.com', '9876543439', '36666, Lajpat Nagar, Delhi', '2030-05-10', 20),
    (228, 'Vinod Yadav', 'vinod.yadav@example.com', '9876543440', '37777, Park Street, Kolkata', '2030-05-15', 24),
    (229, 'Sanjay Rathi', 'sanjay.rathi@example.com', '9876543441', '38888, Churchgate, Mumbai', '2030-06-01', 1),
    (230, 'Akanksha Sharma', 'akanksha.sharma@example.com', '9876543442', '39999, Sector 5, Noida', '2030-06-10', 26),
    (231, 'Rajesh Yadav', 'rajesh.yadav@example.com', '9876543443', '40000, JP Nagar, Bangalore', '2030-06-15', 29),
    (232, 'Ritika Gupta', 'ritika.gupta@example.com', '9876543444', '41111, Satellite, Ahmedabad', '2030-07-01', 15),
    (233, 'Amit Agarwal', 'amit.agarwal@example.com', '9876543445', '42222, MG Road, Mumbai', '2030-07-10', 10),
    (234, 'Suman Verma', 'suman.verma@example.com', '9876543446', '43333, Lajpat Nagar, Delhi', '2030-07-15', 20),
    (235, 'Nikhil Yadav', 'nikhil.yadav@example.com', '9876543447', '44444, Park Street, Kolkata', '2030-08-01', 8),
    (236, 'Pooja Rathi', 'pooja.rathi@example.com', '9876543448', '45555, Churchgate, Mumbai', '2030-08-10', 2),
    (237, 'Raj Kumar', 'raj.kumar@example.com', '9876543449', '46666, Sector 5, Noida', '2030-08-15', 3),
    (238, 'Vikram Sharma', 'vikram.sharma@example.com', '9876543450', '47777, JP Nagar, Bangalore', '2030-09-01', 19),
    (239, 'Nandita Yadav', 'nandita.yadav@example.com', '9876543451', '48888, Satellite, Ahmedabad', '2030-09-10', 6),
    (240, 'Ajay Gupta', 'ajay.gupta@example.com', '9876543452', '49999, MG Road, Mumbai', '2030-09-15', 27),
    (241, 'Shweta Desai', 'shweta.desai@example.com', '9876543453', '50000, Lajpat Nagar, Delhi', '2030-10-01', 1),
    (242, 'Nikhil Rathi', 'nikhil.rathi@example.com', '9876543454', '51111, Park Street, Kolkata', '2030-10-10', 16),
    (243, 'Sakshi Sharma', 'sakshi.sharma@example.com', '9876543455', '52222, Churchgate, Mumbai', '2030-10-15', 13),
    (244, 'Anil Yadav', 'anil.yadav@example.com', '9876543456', '53333, Sector 5, Noida', '2030-11-01', 25),
    (245, 'Sunita Gupta', 'sunita.gupta@example.com', '9876543457', '54444, JP Nagar, Bangalore', '2030-11-10', 11),
    (246, 'Vikas Sharma', 'vikas.sharma@example.com', '9876543458', '55555, Satellite, Ahmedabad', '2030-11-15', 14),
    (247, 'Karan Agarwal', 'karan.agarwal@example.com', '9876543459', '56666, MG Road, Mumbai', '2030-12-01', 22),
    (248, 'Poonam Verma', 'poonam.verma@example.com', '9876543460', '57777, Lajpat Nagar, Delhi', '2030-12-10', 30),
    (249, 'Rahul Yadav', 'rahul.yadav@example.com', '9876543461', '58888, Park Street, Kolkata', '2030-12-15', 17),
    (250, 'Neha Sharma', 'neha.sharma@example.com', '9876543462', '59999, Churchgate, Mumbai', '2031-01-01', 5);




INSERT INTO Plans (plan_id, plan_name, speed, data_limit, price, duration) VALUES
-- 50 Mbps Plans
(1, '50 Mbps Plan - 30 Days', 50, NULL, 550, 30),
(2, '50 Mbps Plan - 90 Days', 50, NULL, 1650, 90),
(3, '50 Mbps Plan - 180 Days', 50, NULL, 3300, 180),
(4, '50 Mbps Plan - 365 Days', 50, NULL, 6600, 365),
(5, '50 Mbps Plan - 540 Days', 50, NULL, 9900, 540),

-- 60 Mbps Plans
(6, '60 Mbps Plan - 30 Days', 60, NULL, 600, 30),
(7, '60 Mbps Plan - 90 Days', 60, NULL, 1800, 90),
(8, '60 Mbps Plan - 180 Days', 60, NULL, 3600, 180),
(9, '60 Mbps Plan - 365 Days', 60, NULL, 7200, 365),
(10, '60 Mbps Plan - 540 Days', 60, NULL, 10800, 540),

-- 70 Mbps Plans
(11, '70 Mbps Plan - 30 Days', 70, NULL, 700, 30),
(12, '70 Mbps Plan - 90 Days', 70, NULL, 2100, 90),
(13, '70 Mbps Plan - 180 Days', 70, NULL, 4200, 180),
(14, '70 Mbps Plan - 365 Days', 70, NULL, 8400, 365),
(15, '70 Mbps Plan - 540 Days', 70, NULL, 12600, 540),

-- 100 Mbps Plans
(16, '100 Mbps Plan - 30 Days', 100, NULL, 800, 30),
(17, '100 Mbps Plan - 90 Days', 100, NULL, 2400, 90),
(18, '100 Mbps Plan - 180 Days', 100, NULL, 4800, 180),
(19, '100 Mbps Plan - 365 Days', 100, NULL, 9600, 365),
(20, '100 Mbps Plan - 540 Days', 100, NULL, 14400, 540),

-- 150 Mbps Plans
(21, '150 Mbps Plan - 30 Days', 150, NULL, 900, 30),
(22, '150 Mbps Plan - 90 Days', 150, NULL, 2700, 90),
(23, '150 Mbps Plan - 180 Days', 150, NULL, 5400, 180),
(24, '150 Mbps Plan - 365 Days', 150, NULL, 10800, 365),
(25, '150 Mbps Plan - 540 Days', 150, NULL, 16200, 540),

-- 200 Mbps Plans
(26, '200 Mbps Plan - 30 Days', 200, NULL, 999, 30),
(27, '200 Mbps Plan - 90 Days', 200, NULL, 3000, 90),
(28, '200 Mbps Plan - 180 Days', 200, NULL, 6000, 180),
(29, '200 Mbps Plan - 365 Days', 200, NULL, 12000, 365),
(30, '200 Mbps Plan - 540 Days', 200, NULL, 18000, 540);

INSERT INTO Subscriptions (subscription_id, user_id, plan_id, start_date, end_date, status) VALUES
(1, 1, 1, '2023-01-15', '2023-02-14', 'Active'),
(2, 2, 2, '2023-02-20', '2023-03-21', 'Active'),
(3, 3, 3, '2023-03-10', '2023-04-09', 'Expired'),
(4, 4, 4, '2023-04-05', '2023-05-05', 'Cancelled'),
(5, 5, 5, '2023-05-15', '2023-06-14', 'Active'),
(6, 6, 6, '2023-06-25', '2023-07-25', 'Active'),
(7, 7, 7, '2023-07-30', '2023-08-29', 'Active'),
(8, 8, 8, '2023-08-12', '2023-09-11', 'Active'),
(9, 9, 1, '2023-09-01', '2023-09-30', 'Active'),
(10, 10, 2, '2023-09-15', '2023-10-15', 'Expired'),
(11, 11, 3, '2023-10-01', '2023-10-31', 'Active'),
(12, 12, 4, '2023-10-10', '2023-11-09', 'Cancelled'),
(13, 13, 5, '2023-11-05', '2023-12-05', 'Active'),
(14, 14, 6, '2023-11-15', '2023-12-15', 'Active'),
(15, 15, 7, '2023-12-01', '2023-12-31', 'Active'),
(16, 16, 8, '2023-12-10', '2024-01-09', 'Active'),
(17, 17, 1, '2024-01-05', '2024-02-04', 'Active'),
(18, 18, 2, '2024-01-15', '2024-02-14', 'Expired'),
(19, 19, 3, '2024-02-01', '2024-03-02', 'Active'),
(20, 20, 4, '2024-02-10', '2024-03-11', 'Cancelled'),
(21, 21, 5, '2024-03-01', '2024-03-31', 'Active'),
(22, 22, 6, '2024-03-15', '2024-04-14', 'Active'),
(23, 23, 7, '2024-04-05', '2024-05-05', 'Active'),
(24, 24, 8, '2024-04-15', '2024-05-15', 'Active'),
(25, 25, 1, '2024-05-01', '2024-05-31', 'Active'),
(26, 26, 2, '2024-05-10', '2024-06-09', 'Expired'),
(27, 27, 3, '2024-06-01', '2024-06-30', 'Active'),
(28, 28, 4, '2024-06-15', '2024-07-15', 'Cancelled'),
(29, 29, 5, '2024-07-05', '2024-08-04', 'Active'),
(30, 30, 6, '2024-07-15', '2024-08-14', 'Active'),
(31, 31, 7, '2024-08-01', '2024-08-31', 'Active'),
(32, 32, 8, '2024-08-15', '2024-09-14', 'Active'),
(33, 33, 1, '2024-09-01', '2024-09-30', 'Active'),
(34, 34, 2, '2024-09-10', '2024-10-10', 'Expired'),
(35, 35, 3, '2024-10-01', '2024-10-31', 'Active'),
(36, 36, 4, '2024-10-05', '2024-11-04', 'Cancelled'),
(37, 37, 5, '2024-11-01', '2024-11-30', 'Active'),
(38, 38, 6, '2024-11-10', '2024-12-10', 'Active'),
(39, 39, 7, '2024-12-01', '2024-12-31', 'Active'),
(40, 40, 8, '2024-12-15', '2025-01-14', 'Active'),
(41, 41, 1, '2025-01-05', '2025-02-04', 'Active'),
(42, 42, 2, '2025-01-15', '2025-02-14', 'Expired'),
(43, 43, 3, '2025-02-01', '2025-02-28', 'Active'),
(44, 44, 4, '2025-02-10', '2025-03-12', 'Cancelled'),
(45, 45, 5, '2025-03-01', '2025-03-31', 'Active'),
(46, 46, 6, '2025-03-15', '2025-04-14', 'Active'),
(47, 47, 7, '2025-04-05', '2025-05-05', 'Active'),
(48, 48, 8, '2025-04-15', '2025-05-15', 'Active'),
(49, 49, 1, '2025-05-01', '2025-05-31', 'Active'),
(50, 50, 2, '2025-05-10', '2025-06-09', 'Expired'),
(51, 51, 3, '2025-06-01', '2025-06-30', 'Active'),
(52, 52, 4, '2025-06-15', '2025-07-15', 'Cancelled'),
(53, 53, 5, '2025-07-05', '2025-08-04', 'Active'),
(54, 54, 6, '2025-07-15', '2025-08-14', 'Active'),
(55, 55, 7, '2025-08-01', '2025-08-31', 'Active'),
(56, 56, 8, '2025-08-15', '2025-09-14', 'Active'),
(57, 57, 1, '2025-09-01', '2025-09-30', 'Active'),
(58, 58, 2, '2025-09-10', '2025-10-10', 'Expired'),
(59, 59, 3, '2025-10-01', '2025-10-31', 'Active'),
(60, 60, 4, '2025-10-05', '2025-11-04', 'Cancelled'),
(61, 61, 5, '2025-11-01', '2025-11-30', 'Active'),
(62, 62, 6, '2025-11-10', '2025-12-10', 'Active'),
(63, 63, 7, '2025-12-01', '2025-12-31', 'Active'),
(64, 64, 8, '2025-12-15', '2026-01-14', 'Active'),
(65, 65, 1, '2026-01-05', '2026-02-04', 'Active'),
(66, 66, 2, '2026-01-15', '2026-02-14', 'Expired'),
(67, 67, 3, '2026-02-01', '2026-02-28', 'Active'),
(68, 68, 4, '2026-02-10', '2026-03-12', 'Cancelled'),
(69, 69, 5, '2026-03-01', '2026-03-31', 'Active'),
(70, 70, 6, '2026-03-15', '2026-04-14', 'Active'),
(71, 71, 7, '2026-04-05', '2026-05-05', 'Active'),
(72, 72, 8, '2026-04-15', '2026-05-15', 'Active'),
(73, 73, 1, '2026-05-01', '2026-05-31', 'Active'),
(74, 74, 2, '2026-05-10', '2026-06-09', 'Expired'),
(75, 75, 3, '2026-06-01', '2026-06-30', 'Active'),
(76, 76, 4, '2026-06-15', '2026-07-15', 'Cancelled'),
(77, 77, 5, '2026-07-05', '2026-08-04', 'Active'),
(78, 78, 6, '2026-07-15', '2026-08-14', 'Active'),
(79, 79, 7, '2026-08-01', '2026-08-31', 'Active'),
(80, 80, 8, '2026-08-15', '2026-09-14', 'Active'),
(81, 81, 1, '2026-09-01', '2026-09-30', 'Active'),
(82, 82, 2, '2026-09-10', '2026-10-10', 'Expired'),
(83, 83, 3, '2026-10-01', '2026-10-31', 'Active'),
(84, 84, 4, '2026-10-05', '2026-11-04', 'Cancelled'),
(85, 85, 5, '2026-11-01', '2026-11-30', 'Active'),
(86, 86, 6, '2026-11-10', '2026-12-10', 'Active'),
(87, 87, 7, '2026-12-01', '2026-12-31', 'Active'),
(88, 88, 8, '2026-12-15', '2027-01-14', 'Active'),
(89, 89, 1, '2027-01-05', '2027-02-04', 'Active'),
(90, 90, 2, '2027-01-15', '2027-02-14', 'Expired'),
(91, 91, 3, '2027-02-01', '2027-02-28', 'Active'),
(92, 92, 4, '2027-02-10', '2027-03-12', 'Cancelled'),
(93, 93, 5, '2027-03-01', '2027-03-31', 'Active'),
(94, 94, 6, '2027-03-15', '2027-04-14', 'Active'),
(95, 95, 7, '2027-04-05', '2027-05-05', 'Active'),
(96, 96, 8, '2027-04-15', '2027-05-15', 'Active'),
(97, 97, 1, '2027-05-01', '2027-05-31', 'Active'),
(98, 98, 2, '2027-05-10', '2027-06-09', 'Expired'),
(99, 99, 3, '2027-06-01', '2027-06-30', 'Active'),
(100, 100, 4, '2027-06-15', '2027-07-15', 'Cancelled');

INSERT INTO UsageHistory (usage_h_id, user_id, date, data_used) VALUES
(1, 1, '2023-01-01', 2.5),
(2, 1, '2023-01-02', 3.2),
(3, 1, '2023-01-03', 1.8),
(4, 1, '2023-01-04', 4.5),
(5, 1, '2023-01-05', 5.0),
(6, 1, '2023-01-06', 2.9),
(7, 1, '2023-01-07', 3.5),
(8, 1, '2023-01-08', 6.1),
(9, 1, '2023-01-09', 4.0),
(10, 1, '2023-01-10', 3.3),
(11, 2, '2023-01-01', 4.0),
(12, 2, '2023-01-02', 3.8),
(13, 2, '2023-01-03', 5.2),
(14, 2, '2023-01-04', 6.7),
(15, 2, '2023-01-05', 8.5),
(16, 2, '2023-01-06', 4.1),
(17, 2, '2023-01-07', 5.6),
(18, 2, '2023-01-08', 6.9),
(19, 2, '2023-01-09', 7.5),
(20, 2, '2023-01-10', 5.7),
(21, 3, '2023-01-01', 10.1),
(22, 3, '2023-01-02', 8.4),
(23, 3, '2023-01-03', 9.9),
(24, 3, '2023-01-04', 12.0),
(25, 3, '2023-01-05', 11.5),
(26, 3, '2023-01-06', 13.2),
(27, 3, '2023-01-07', 14.1),
(28, 3, '2023-01-08', 12.5),
(29, 3, '2023-01-09', 15.0),
(30, 3, '2023-01-10', 10.3),
(31, 4, '2023-01-01', 3.4),
(32, 4, '2023-01-02', 2.5),
(33, 4, '2023-01-03', 3.8),
(34, 4, '2023-01-04', 1.9),
(35, 4, '2023-01-05', 4.2),
(36, 4, '2023-01-06', 3.0),
(37, 4, '2023-01-07', 5.3),
(38, 4, '2023-01-08', 4.6),
(39, 4, '2023-01-09', 3.7),
(40, 4, '2023-01-10', 6.0),
(41, 5, '2023-01-01', 7.0),
(42, 5, '2023-01-02', 6.3),
(43, 5, '2023-01-03', 8.1),
(44, 5, '2023-01-04', 5.7),
(45, 5, '2023-01-05', 6.9),
(46, 5, '2023-01-06', 7.5),
(47, 5, '2023-01-07', 8.2),
(48, 5, '2023-01-08', 9.1),
(49, 5, '2023-01-09', 8.0),
(50, 5, '2023-01-10', 10.0),
(51, 6, '2023-01-01', 3.9),
(52, 6, '2023-01-02', 4.4),
(53, 6, '2023-01-03', 2.6),
(54, 6, '2023-01-04', 5.5),
(55, 6, '2023-01-05', 3.1),
(56, 6, '2023-01-06', 4.8),
(57, 6, '2023-01-07', 2.3),
(58, 6, '2023-01-08', 5.1),
(59, 6, '2023-01-09', 6.0),
(60, 6, '2023-01-10', 3.8),
(61, 7, '2023-01-01', 10.0),
(62, 7, '2023-01-02', 12.3),
(63, 7, '2023-01-03', 9.6),
(64, 7, '2023-01-04', 11.0),
(65, 7, '2023-01-05', 8.7),
(66, 7, '2023-01-06', 10.5),
(67, 7, '2023-01-07', 7.9),
(68, 7, '2023-01-08', 12.1),
(69, 7, '2023-01-09', 13.5),
(70, 7, '2023-01-10', 11.3),
(71, 8, '2023-01-01', 2.7),
(72, 8, '2023-01-02', 3.2),
(73, 8, '2023-01-03', 4.8),
(74, 8, '2023-01-04', 2.4),
(75, 8, '2023-01-05', 3.9),
(76, 8, '2023-01-06', 4.5),
(77, 8, '2023-01-07', 5.1),
(78, 8, '2023-01-08', 6.2),
(79, 8, '2023-01-09', 3.3),
(80, 8, '2023-01-10', 2.9),
(81, 9, '2023-01-01', 8.4),
(82, 9, '2023-01-02', 7.7),
(83, 9, '2023-01-03', 9.0),
(84, 9, '2023-01-04', 8.8),
(85, 9, '2023-01-05', 9.5),
(86, 9, '2023-01-06', 7.3),
(87, 9, '2023-01-07', 10.0),
(88, 9, '2023-01-08', 9.1),
(89, 9, '2023-01-09', 8.2),
(90, 9, '2023-01-10', 10.5),
(91, 10, '2023-01-01', 4.3),
(92, 10, '2023-01-02', 5.1),
(93, 10, '2023-01-03', 6.2),
(94, 10, '2023-01-04', 4.9),
(95, 10, '2023-01-05', 3.8),
(96, 10, '2023-01-06', 5.5),
(97, 10, '2023-01-07', 4.0),
(98, 10, '2023-01-08', 6.8),
(99, 10, '2023-01-09', 5.2),
(100, 10, '2023-01-10', 7.6);


-- Generating 100 sample invoices for demonstration purposes
INSERT INTO Invoice (invoice_id, subscription_id, invoice_date, due_date, amount, status) VALUES
(1, 1, '2024-01-01', '2024-01-15', 550, 'Paid'),
(2, 2, '2024-01-03', '2024-01-17', 1650, 'Unpaid'),
(3, 3, '2024-01-05', '2024-01-19', 3300, 'Overdue'),
(4, 4, '2024-01-07', '2024-01-21', 6600, 'Paid'),
(5, 5, '2024-01-09', '2024-01-23', 9900, 'Paid'),
(6, 6, '2024-01-11', '2024-01-25', 600, 'Unpaid'),
(7, 7, '2024-01-13', '2024-01-27', 1800, 'Paid'),
(8, 8, '2024-01-15', '2024-01-29', 3600, 'Overdue'),
(9, 9, '2024-01-17', '2024-01-31', 7200, 'Paid'),
(10, 10, '2024-01-19', '2024-02-02', 10800, 'Unpaid'),
(11, 11, '2024-01-21', '2024-02-04', 999, 'Paid'),
(12, 12, '2024-01-23', '2024-02-06', 2400, 'Unpaid'),
(13, 13, '2024-01-25', '2024-02-08', 4800, 'Overdue'),
(14, 14, '2024-01-27', '2024-02-10', 5400, 'Paid'),
(15, 15, '2024-01-29', '2024-02-12', 12600, 'Paid'),
(16, 16, '2024-02-01', '2024-02-15', 800, 'Unpaid'),
(17, 17, '2024-02-03', '2024-02-17', 3000, 'Overdue'),
(18, 18, '2024-02-05', '2024-02-19', 6000, 'Paid'),
(19, 19, '2024-02-07', '2024-02-21', 6600, 'Paid'),
(20, 20, '2024-02-09', '2024-02-23', 9900, 'Unpaid'),
(21, 21, '2024-02-11', '2024-02-25', 550, 'Overdue'),
(22, 22, '2024-02-13', '2024-02-27', 1650, 'Paid'),
(23, 23, '2024-02-15', '2024-03-01', 3300, 'Unpaid'),
(24, 24, '2024-02-17', '2024-03-03', 6600, 'Paid'),
(25, 25, '2024-02-19', '2024-03-05', 9900, 'Overdue'),
(26, 26, '2024-02-21', '2024-03-07', 600, 'Paid'),
(27, 27, '2024-02-23', '2024-03-09', 1800, 'Unpaid'),
(28, 28, '2024-02-25', '2024-03-11', 3600, 'Paid'),
(29, 29, '2024-02-27', '2024-03-13', 7200, 'Overdue'),
(30, 30, '2024-02-29', '2024-03-15', 10800, 'Paid'),
(31, 31, '2024-03-01', '2024-03-15', 999, 'Unpaid'),
(32, 32, '2024-03-03', '2024-03-17', 2400, 'Paid'),
(33, 33, '2024-03-05', '2024-03-19', 4800, 'Overdue'),
(34, 34, '2024-03-07', '2024-03-21', 5400, 'Paid'),
(35, 35, '2024-03-09', '2024-03-23', 12600, 'Paid'),
(36, 36, '2024-03-11', '2024-03-25', 800, 'Unpaid'),
(37, 37, '2024-03-13', '2024-03-27', 3000, 'Paid'),
(38, 38, '2024-03-15', '2024-03-29', 6000, 'Overdue'),
(39, 39, '2024-03-17', '2024-03-31', 6600, 'Paid'),
(40, 40, '2024-03-19', '2024-04-02', 9900, 'Unpaid'),
(41, 41, '2024-03-21', '2024-04-04', 550, 'Paid'),
(42, 42, '2024-03-23', '2024-04-06', 1650, 'Overdue'),
(43, 43, '2024-03-25', '2024-04-08', 3300, 'Paid'),
(44, 44, '2024-03-27', '2024-04-10', 6600, 'Unpaid'),
(45, 45, '2024-03-29', '2024-04-12', 9900, 'Overdue'),
(46, 46, '2024-03-31', '2024-04-14', 600, 'Paid'),
(47, 47, '2024-04-01', '2024-04-15', 1800, 'Unpaid'),
(48, 48, '2024-04-03', '2024-04-17', 3600, 'Paid'),
(49, 49, '2024-04-05', '2024-04-19', 7200, 'Overdue'),
(50, 50, '2024-04-07', '2024-04-21', 10800, 'Paid'),
(51, 51, '2024-04-09', '2024-04-23', 999, 'Paid'),
(52, 52, '2024-04-11', '2024-04-25', 2400, 'Unpaid'),
(53, 53, '2024-04-13', '2024-04-27', 4800, 'Paid'),
(54, 54, '2024-04-15', '2024-04-29', 5400, 'Overdue'),
(55, 55, '2024-04-17', '2024-05-01', 12600, 'Paid'),
(56, 56, '2024-04-19', '2024-05-03', 800, 'Unpaid'),
(57, 57, '2024-04-21', '2024-05-05', 3000, 'Overdue'),
(58, 58, '2024-04-23', '2024-05-07', 6000, 'Paid'),
(59, 59, '2024-04-25', '2024-05-09', 6600, 'Paid'),
(60, 60, '2024-04-27', '2024-05-11', 9900, 'Unpaid'),
(61, 61, '2024-04-29', '2024-05-13', 550, 'Overdue'),
(62, 62, '2024-05-01', '2024-05-15', 1650, 'Paid'),
(63, 63, '2024-05-03', '2024-05-17', 3300, 'Unpaid'),
(64, 64, '2024-05-05', '2024-05-19', 6600, 'Paid'),
(65, 65, '2024-05-07', '2024-05-21', 9900, 'Overdue'),
(66, 66, '2024-05-09', '2024-05-23', 600, 'Paid'),
(67, 67, '2024-05-11', '2024-05-25', 1800, 'Unpaid'),
(68, 68, '2024-05-13', '2024-05-27', 3600, 'Paid'),
(69, 69, '2024-05-15', '2024-05-29', 7200, 'Overdue'),
(70, 70, '2024-05-17', '2024-05-31', 10800, 'Paid'),
(71, 71, '2024-05-19', '2024-06-02', 999, 'Unpaid'),
(72, 72, '2024-05-21', '2024-06-04', 2400, 'Paid'),
(73, 73, '2024-05-23', '2024-06-06', 4800, 'Overdue'),
(74, 74, '2024-05-25', '2024-06-08', 5400, 'Paid'),
(75, 75, '2024-05-27', '2024-06-10', 12600, 'Paid'),
(76, 76, '2024-05-29', '2024-06-12', 800, 'Unpaid'),
(77, 77, '2024-06-01', '2024-06-15', 3000, 'Overdue'),
(78, 78, '2024-06-03', '2024-06-17', 6000, 'Paid'),
(79, 79, '2024-06-05', '2024-06-19', 6600, 'Paid'),
(80, 80, '2024-06-07', '2024-06-21', 9900, 'Unpaid'),
(81, 81, '2024-06-09', '2024-06-23', 550, 'Overdue'),
(82, 82, '2024-06-11', '2024-06-25', 1650, 'Paid'),
(83, 83, '2024-06-13', '2024-06-27', 3300, 'Unpaid'),
(84, 84, '2024-06-15', '2024-06-29', 6600, 'Paid'),
(85, 85, '2024-06-17', '2024-07-01', 9900, 'Overdue'),
(86, 86, '2024-06-19', '2024-07-03', 600, 'Paid'),
(87, 87, '2024-06-21', '2024-07-05', 1800, 'Unpaid'),
(88, 88, '2024-06-23', '2024-07-07', 3600, 'Paid'),
(89, 89, '2024-06-25', '2024-07-09', 7200, 'Overdue'),
(90, 90, '2024-06-27', '2024-07-11', 10800, 'Paid'),
(91, 91, '2024-06-29', '2024-07-13', 999, 'Unpaid'),
(92, 92, '2024-07-01', '2024-07-15', 2400, 'Paid'),
(93, 93, '2024-07-03', '2024-07-17', 4800, 'Overdue'),
(94, 94, '2024-07-05', '2024-07-19', 5400, 'Paid'),
(95, 95, '2024-07-07', '2024-07-21', 12600, 'Paid'),
(96, 96, '2024-07-09', '2024-07-23', 800, 'Unpaid'),
(97, 97, '2024-07-11', '2024-07-25', 3000, 'Overdue'),
(98, 98, '2024-07-13', '2024-07-27', 6000, 'Paid'),
(99, 99, '2024-07-15', '2024-07-29', 6600, 'Paid'),
(100, 100, '2024-07-17', '2024-07-31', 9900, 'Unpaid');

INSERT INTO SupportTickets (ticket_id, user_id, issue_description, status, created_date, resolved_date) VALUES 
    (1, 1, 'No internet connection', 'Closed', '2024-01-15', '2024-01-16'),
    (2, 2, 'Installation issue', 'Open', '2024-01-20', NULL),
    (3, 3, 'Billing error', 'In Progress', '2024-02-05', NULL),
    (4, 4, 'Slow internet speed', 'Closed', '2024-04-02', '2024-04-03'),
    (5, 5, 'Router setup assistance', 'Open', '2024-04-16', NULL),
    (6, 6, 'Frequent disconnections', 'Closed', '2024-05-11', '2024-05-12'),
    (7, 7, 'Upgrade request', 'In Progress', '2024-05-21', NULL),
    (8, 8, 'Billing discrepancy', 'Open', '2024-06-02', NULL),
    (9, 9, 'Speed test results', 'Closed', '2024-06-10', '2024-06-11'),
    (10, 10, 'Wi-Fi range issue', 'Open', '2024-06-15', NULL),
    (11, 1, 'Account access issue', 'Closed', '2024-06-18', '2024-06-19'),
    (12, 2, 'Streaming issues', 'In Progress', '2024-06-20', NULL),
    (13, 3, 'Service cancellation', 'Open', '2024-06-22', NULL),
    (14, 4, 'Refund request', 'Closed', '2024-06-25', '2024-06-26'),
    (15, 5, 'Configuration help', 'Open', '2024-06-28', NULL),
    (16, 6, 'Latency issues', 'In Progress', '2024-07-02', NULL),
    (17, 7, 'Network outage', 'Closed', '2024-07-05', '2024-07-06'),
    (18, 8, 'Technical support', 'Open', '2024-07-09', NULL),
    (19, 9, 'Router hardware issue', 'In Progress', '2024-07-12', NULL),
    (20, 10, 'Software update', 'Closed', '2024-07-15', '2024-07-16'),
    (21, 1, 'Disconnection during calls', 'Open', '2024-07-18', NULL),
    (22, 2, 'Connectivity issue', 'Closed', '2024-07-20', '2024-07-21'),
    (23, 3, 'Feedback on service', 'In Progress', '2024-07-25', NULL),
    (24, 4, 'Device compatibility', 'Open', '2024-08-01', NULL),
    (25, 5, 'Monthly bill clarification', 'Closed', '2024-08-05', '2024-08-06'),
    (26, 6, 'Quality of service complaint', 'Open', '2024-08-10', NULL),
    (27, 7, 'Unexpected charges', 'Closed', '2024-08-15', '2024-08-16'),
    (28, 8, 'Service not available', 'In Progress', '2024-08-20', NULL),
    (29, 9, 'Help with account settings', 'Open', '2024-08-25', NULL),
    (30, 10, 'Feedback for improvement', 'Closed', '2024-08-30', '2024-08-31');
 
INSERT INTO Payments (payment_id, invoice_id, amount, payment_date, payment_method, status) VALUES
(1, 1, 550, '2024-10-01', 'UPI', 'Completed'),
(2, 2, 1650, '2024-10-01', 'UPI', 'Completed'),
(3, 3, 3300, '2024-10-01', 'Debit Card', 'Completed'),
(4, 4, 6600, '2024-10-01', 'Net Banking', 'Completed'),
(5, 5, 9900, '2024-10-01', 'UPI', 'Completed'),
(6, 6, 600, '2024-10-01', 'Debit Card', 'Completed'),
(7, 7, 1800, '2024-10-01', 'UPI', 'Completed'),
(8, 8, 3600, '2024-10-01', 'Net Banking', 'Completed'),
(9, 9, 7200, '2024-10-01', 'UPI', 'Completed'),
(10, 10, 10800, '2024-10-01', 'Debit Card', 'Completed'),
(11, 11, 700, '2024-10-01', 'UPI', 'Completed'),
(12, 12, 2100, '2024-10-01', 'Net Banking', 'Completed'),
(13, 13, 4200, '2024-10-01', 'UPI', 'Completed'),
(14, 14, 8400, '2024-10-01', 'Debit Card', 'Completed'),
(15, 15, 12600, '2024-10-01', 'UPI', 'Completed'),
(16, 16, 800, '2024-10-01', 'Debit Card', 'Completed'),
(17, 17, 2400, '2024-10-01', 'Net Banking', 'Completed'),
(18, 18, 4800, '2024-10-01', 'UPI', 'Completed'),
(19, 19, 9600, '2024-10-01', 'Debit Card', 'Completed'),
(20, 20, 14400, '2024-10-01', 'UPI', 'Completed'),
(21, 21, 900, '2024-10-01', 'Net Banking', 'Completed'),
(22, 22, 2700, '2024-10-01', 'UPI', 'Completed'),
(23, 23, 5400, '2024-10-01', 'Debit Card', 'Completed'),
(24, 24, 10800, '2024-10-01', 'UPI', 'Completed'),
(25, 25, 16200, '2024-10-01', 'Debit Card', 'Completed'),
(26, 26, 999, '2024-10-01', 'Net Banking', 'Completed'),
(27, 27, 3000, '2024-10-01', 'UPI', 'Completed'),
(28, 28, 6000, '2024-10-01', 'Debit Card', 'Completed'),
(29, 29, 12000, '2024-10-01', 'UPI', 'Completed'),
(30, 30, 18000, '2024-10-01', 'Debit Card', 'Completed'),
(31, 1, 550, '2024-10-02', 'UPI', 'Completed'),
(32, 2, 1650, '2024-10-02', 'UPI', 'Completed'),
(33, 3, 3300, '2024-10-02', 'Debit Card', 'Completed'),
(34, 4, 6600, '2024-10-02', 'Net Banking', 'Completed'),
(35, 5, 9900, '2024-10-02', 'UPI', 'Completed'),
(36, 6, 600, '2024-10-02', 'Debit Card', 'Completed'),
(37, 7, 1800, '2024-10-02', 'UPI', 'Completed'),
(38, 8, 3600, '2024-10-02', 'Net Banking', 'Completed'),
(39, 9, 7200, '2024-10-02', 'UPI', 'Completed'),
(40, 10, 10800, '2024-10-02', 'Debit Card', 'Completed'),
(41, 11, 700, '2024-10-02', 'UPI', 'Completed'),
(42, 12, 2100, '2024-10-02', 'Net Banking', 'Completed'),
(43, 13, 4200, '2024-10-02', 'UPI', 'Completed'),
(44, 14, 8400, '2024-10-02', 'Debit Card', 'Completed'),
(45, 15, 12600, '2024-10-02', 'UPI', 'Completed'),
(46, 16, 800, '2024-10-02', 'Debit Card', 'Completed'),
(47, 17, 2400, '2024-10-02', 'Net Banking', 'Completed'),
(48, 18, 4800, '2024-10-02', 'UPI', 'Completed'),
(49, 19, 9600, '2024-10-02', 'Debit Card', 'Completed'),
(50, 20, 14400, '2024-10-02', 'UPI', 'Completed'),
(51, 21, 900, '2024-10-02', 'Net Banking', 'Completed'),
(52, 22, 2700, '2024-10-02', 'UPI', 'Completed'),
(53, 23, 5400, '2024-10-02', 'Debit Card', 'Completed'),
(54, 24, 10800, '2024-10-02', 'UPI', 'Completed'),
(55, 25, 16200, '2024-10-02', 'Debit Card', 'Completed'),
(56, 26, 999, '2024-10-02', 'Net Banking', 'Completed'),
(57, 27, 3000, '2024-10-02', 'UPI', 'Completed'),
(58, 28, 6000, '2024-10-02', 'Debit Card', 'Completed'),
(59, 29, 12000, '2024-10-02', 'UPI', 'Completed'),
(60, 30, 18000, '2024-10-02', 'Debit Card', 'Completed'),
(61, 1, 550, '2024-10-03', 'UPI', 'Completed'),
(62, 2, 1650, '2024-10-03', 'UPI', 'Completed'),
(63, 3, 3300, '2024-10-03', 'Debit Card', 'Completed'),
(64, 4, 6600, '2024-10-03', 'Net Banking', 'Completed'),
(65, 5, 9900, '2024-10-03', 'UPI', 'Completed'),
(66, 6, 600, '2024-10-03', 'Debit Card', 'Completed'),
(67, 7, 1800, '2024-10-03', 'UPI', 'Completed'),
(68, 8, 3600, '2024-10-03', 'Net Banking', 'Completed'),
(69, 9, 7200, '2024-10-03', 'UPI', 'Completed'),
(70, 10, 10800, '2024-10-03', 'Debit Card', 'Completed'),
(71, 11, 700, '2024-10-03', 'UPI', 'Completed'),
(72, 12, 2100, '2024-10-03', 'Net Banking', 'Completed'),
(73, 13, 4200, '2024-10-03', 'UPI', 'Completed'),
(74, 14, 8400, '2024-10-03', 'Debit Card', 'Completed'),
(75, 15, 12600, '2024-10-03', 'UPI', 'Completed'),
(76, 16, 800, '2024-10-03', 'Debit Card', 'Completed'),
(77, 17, 2400, '2024-10-03', 'Net Banking', 'Completed'),
(78, 18, 4800, '2024-10-03', 'UPI', 'Completed'),
(79, 19, 9600, '2024-10-03', 'Debit Card', 'Completed'),
(80, 20, 14400, '2024-10-03', 'UPI', 'Completed'),
(81, 21, 900, '2024-10-03', 'Net Banking', 'Completed'),
(82, 22, 2700, '2024-10-03', 'UPI', 'Completed'),
(83, 23, 5400, '2024-10-03', 'Debit Card', 'Completed'),
(84, 24, 10800, '2024-10-03', 'UPI', 'Completed'),
(85, 25, 16200, '2024-10-03', 'Debit Card', 'Completed'),
(86, 26, 999, '2024-10-03', 'Net Banking', 'Completed'),
(87, 27, 3000, '2024-10-03', 'UPI', 'Completed'),
(88, 28, 6000, '2024-10-03', 'Debit Card', 'Completed'),
(89, 29, 12000, '2024-10-03', 'UPI', 'Completed'),
(90, 30, 18000, '2024-10-03', 'Debit Card', 'Completed'),
(91, 1, 550, '2024-10-04', 'UPI', 'Completed'),
(92, 2, 1650, '2024-10-04', 'UPI', 'Completed'),
(93, 3, 3300, '2024-10-04', 'Debit Card', 'Completed'),
(94, 4, 6600, '2024-10-04', 'Net Banking', 'Completed'),
(95, 5, 9900, '2024-10-04', 'UPI', 'Completed'),
(96, 6, 600, '2024-10-04', 'Debit Card', 'Completed'),
(97, 7, 1800, '2024-10-04', 'UPI', 'Completed'),
(98, 8, 3600, '2024-10-04', 'Net Banking', 'Completed'),
(99, 9, 7200, '2024-10-04', 'UPI', 'Completed'),
(100, 10, 10800, '2024-10-04', 'Debit Card', 'Completed');


INSERT INTO Technicians (technician_id, full_name, contact_number, email, area_served) VALUES
    (1, 'Rajesh Kumar', '9876543215', 'rajesh.kumar@example.com', 'Mumbai'),
    (2, 'Anita Desai', '9876543216', 'anita.desai@example.com', 'Delhi'),
    (3, 'Vikas Rao', '9876543217', 'vikas.rao@example.com', 'Bangalore'),
    (4, 'Sunita Mishra', '9876543218', 'sunita.mishra@example.com', 'Ahmedabad'),
    (5, 'Rohit Mehta', '9876543219', 'rohit.mehta@example.com', 'Chennai'),
    (6, 'Priya Singh', '9876543220', 'priya.singh@example.com', 'Mumbai'),
    (7, 'Amit Patil', '9876543221', 'amit.patil@example.com', 'Mumbai'),
    (8, 'Nisha Joshi', '9876543222', 'nisha.joshi@example.com', 'Mumbai'),
    (9, 'Vijay Sharma', '9876543223', 'vijay.sharma@example.com', 'Delhi'),
    (10, 'Deepa Gupta', '9876543224', 'deepa.gupta@example.com', 'Delhi'),
    (11, 'Suresh Yadav', '9876543225', 'suresh.yadav@example.com', 'Delhi'),
    (12, 'Ravi Menon', '9876543226', 'ravi.menon@example.com', 'Bangalore'),
    (13, 'Sneha Nair', '9876543227', 'sneha.nair@example.com', 'Bangalore'),
    (14, 'Arjun Iyer', '9876543228', 'arjun.iyer@example.com', 'Bangalore'),
    (15, 'Pooja Shah', '9876543229', 'pooja.shah@example.com', 'Ahmedabad'),
    (16, 'Kiran Thakkar', '9876543230', 'kiran.thakkar@example.com', 'Ahmedabad'),
    (17, 'Rajiv Soni', '9876543231', 'rajiv.soni@example.com', 'Ahmedabad'),
	(18, 'Divya Ramesh', '9876543232', 'divya.ramesh@example.com', 'Chennai'),
    (19, 'Manoj Kumar', '9876543233', 'manoj.kumar@example.com', 'Chennai'),
    (20, 'Lakshmi Reddy', '9876543234', 'lakshmi.reddy@example.com', 'Chennai');


INSERT INTO ServiceAppointments (appointment_id, user_id, technician_id, service_date, service_type, status) VALUES
    (1, 1, 1, '2023-01-15', 'Installation', 'Completed'),
    (2, 2, 2, '2023-02-18', 'Maintenance', 'Completed'),
    (3, 3, 3, '2023-03-22', 'Repair', 'Scheduled'),
    (4, 4, 4, '2023-04-28', 'Repair', 'In Progress'),
    (5, 5, 5, '2023-05-10', 'Maintenance', 'Scheduled'),
    (6, 1, 6, '2023-06-15', 'Installation', 'Completed'),
    (7, 2, 7, '2023-07-20', 'Repair', 'In Progress'),
    (8, 3, 8, '2023-08-25', 'Maintenance', 'Scheduled'),
    (9, 4, 9, '2023-09-30', 'Installation', 'Completed'),
    (10, 5, 10, '2023-10-05', 'Repair', 'Scheduled'),
    (11, 6, 11, '2023-11-12', 'Maintenance', 'Completed'),
    (12, 7, 12, '2023-12-15', 'Installation', 'In Progress'),
    (13, 8, 13, '2024-01-18', 'Repair', 'Scheduled'),
    (14, 9, 14, '2024-02-22', 'Maintenance', 'Completed'),
    (15, 10, 15, '2024-03-25', 'Installation', 'Completed'),
    (16, 11, 16, '2024-04-15', 'Repair', 'Scheduled'),
    (17, 12, 17, '2024-05-20', 'Maintenance', 'In Progress'),
    (18, 13, 18, '2024-06-25', 'Installation', 'Completed'),
    (19, 14, 19, '2024-07-30', 'Repair', 'Scheduled'),
    (20, 15, 20, '2024-08-10', 'Maintenance', 'Completed'),
    (21, 16, 1, '2024-09-15', 'Installation', 'In Progress'),
    (22, 17, 2, '2024-10-20', 'Repair', 'Scheduled'),
    (23, 18, 3, '2024-11-25', 'Maintenance', 'Completed'),
    (24, 19, 4, '2024-12-30', 'Installation', 'Completed'),
    (25, 20, 5, '2025-01-05', 'Repair', 'Scheduled');
    
    -- Insert values into the Billing table for 300 users based on the Plans
INSERT INTO Billing (bill_id, user_id, subscription_id, billing_period_start, billing_period_end, total_amount)
VALUES
    -- 50 Mbps Plans
    (1, 1, 1, '2024-01-01', '2024-01-31', 550),   
    (2, 2, 2, '2024-02-01', '2024-02-29', 1650),  
    (3, 3, 3, '2024-03-01', '2024-03-31', 3300),  
    (4, 4, 4, '2024-04-01', '2024-04-30', 6600),  
    (5, 5, 5, '2024-05-01', '2024-05-31', 9900),  

    -- 60 Mbps Plans
    (6, 6, 6, '2024-01-01', '2024-01-31', 600),   
    (7, 7, 7, '2024-02-01', '2024-02-29', 1800),  
    (8, 8, 8, '2024-03-01', '2024-03-31', 3600),  
    (9, 9, 9, '2024-04-01', '2024-04-30', 7200),  
    (10, 10, 10, '2024-05-01', '2024-05-31', 10800),  

    -- 70 Mbps Plans
    (11, 11, 11, '2024-01-01', '2024-01-31', 700),   
    (12, 12, 12, '2024-02-01', '2024-02-29', 2100),  
    (13, 13, 13, '2024-03-01', '2024-03-31', 4200),  
    (14, 14, 14, '2024-04-01', '2024-04-30', 8400),  
    (15, 15, 15, '2024-05-01', '2024-05-31', 12600),  

    -- 100 Mbps Plans
    (16, 16, 16, '2024-01-01', '2024-01-31', 800),   
    (17, 17, 17, '2024-02-01', '2024-02-29', 2400),  
    (18, 18, 18, '2024-03-01', '2024-03-31', 4800),  
    (19, 19, 19, '2024-04-01', '2024-04-30', 9600),  
    (20, 20, 20, '2024-05-01', '2024-05-31', 14400),  

    -- 150 Mbps Plans
    (21, 21, 21, '2024-01-01', '2024-01-31', 900),   
    (22, 22, 22, '2024-02-01', '2024-02-29', 2700),  
    (23, 23, 23, '2024-03-01', '2024-03-31', 5400),  
    (24, 24, 24, '2024-04-01', '2024-04-30', 10800),  
    (25, 25, 25, '2024-05-01', '2024-05-31', 16200),  

    -- 200 Mbps Plans
    (26, 26, 26, '2024-01-01', '2024-01-31', 999),   
    (27, 27, 27, '2024-02-01', '2024-02-29', 3000),  
    (28, 28, 28, '2024-03-01', '2024-03-31', 6000),  
    (29, 29, 29, '2024-04-01', '2024-04-30', 12000),  
    (30, 30, 30, '2024-05-01', '2024-05-31', 18000),  
    (31, 31, 1, '2024-01-01', '2024-01-31', 550),
    (32, 32, 2, '2024-02-01', '2024-02-29', 1650),
    (33, 33, 3, '2024-03-01', '2024-03-31', 3300),
    (34, 34, 4, '2024-04-01', '2024-04-30', 6600),
    (35, 35, 5, '2024-05-01', '2024-05-31', 9900),

    (36, 36, 6, '2024-01-01', '2024-01-31', 600),
    (37, 37, 7, '2024-02-01', '2024-02-29', 1800),
    (38, 38, 8, '2024-03-01', '2024-03-31', 3600),
    (39, 39, 9, '2024-04-01', '2024-04-30', 7200),
    (40, 40, 10, '2024-05-01', '2024-05-31', 10800),

    (41, 41, 11, '2024-01-01', '2024-01-31', 700),
    (42, 42, 12, '2024-02-01', '2024-02-29', 2100),
    (43, 43, 13, '2024-03-01', '2024-03-31', 4200),
    (44, 44, 14, '2024-04-01', '2024-04-30', 8400),
    (45, 45, 15, '2024-05-01', '2024-05-31', 12600),

    (46, 46, 16, '2024-01-01', '2024-01-31', 800),
    (47, 47, 17, '2024-02-01', '2024-02-29', 2400),
    (48, 48, 18, '2024-03-01', '2024-03-31', 4800),
    (49, 49, 19, '2024-04-01', '2024-04-30', 9600),
    (50, 50, 20, '2024-05-01', '2024-05-31', 14400),

    (51, 51, 21, '2024-01-01', '2024-01-31', 900),
    (52, 52, 22, '2024-02-01', '2024-02-29', 2700),
    (53, 53, 23, '2024-03-01', '2024-03-31', 5400),
    (54, 54, 24, '2024-04-01', '2024-04-30', 10800),
    (55, 55, 25, '2024-05-01', '2024-05-31', 16200),

    (56, 56, 26, '2024-01-01', '2024-01-31', 999),
    (57, 57, 27, '2024-02-01', '2024-02-29', 3000),
    (58, 58, 28, '2024-03-01', '2024-03-31', 6000),
    (59, 59, 29, '2024-04-01', '2024-04-30', 12000),
    (60, 60, 30, '2024-05-01', '2024-05-31', 18000),
    (61, 61, 1, '2024-01-01', '2024-01-31', 550),
    (62, 62, 2, '2024-02-01', '2024-02-29', 1650),
    (63, 63, 3, '2024-03-01', '2024-03-31', 3300),
    (64, 64, 4, '2024-04-01', '2024-04-30', 6600),
    (65, 65, 5, '2024-05-01', '2024-05-31', 9900),
    -- 50 Mbps Plans
    (66, 66, 1, '2024-01-01', '2024-01-31', 550),
    (67, 67, 2, '2024-02-01', '2024-02-29', 1650),
    (68, 68, 3, '2024-03-01', '2024-03-31', 3300),
    (69, 69, 4, '2024-04-01', '2024-04-30', 6600),
    (70, 70, 5, '2024-05-01', '2024-05-31', 9900),

    -- 60 Mbps Plans
    (71, 71, 6, '2024-01-01', '2024-01-31', 600),
    (72, 72, 7, '2024-02-01', '2024-02-29', 1800),
    (73, 73, 8, '2024-03-01', '2024-03-31', 3600),
    (74, 74, 9, '2024-04-01', '2024-04-30', 7200),
    (75, 75, 10, '2024-05-01', '2024-05-31', 10800),

    -- 70 Mbps Plans
    (76, 76, 11, '2024-01-01', '2024-01-31', 700),
    (77, 77, 12, '2024-02-01', '2024-02-29', 2100),
    (78, 78, 13, '2024-03-01', '2024-03-31', 4200),
    (79, 79, 14, '2024-04-01', '2024-04-30', 8400),
    (80, 80, 15, '2024-05-01', '2024-05-31', 12600),

    -- 100 Mbps Plans
    (81, 81, 16, '2024-01-01', '2024-01-31', 800),
    (82, 82, 17, '2024-02-01', '2024-02-29', 2400),
    (83, 83, 18, '2024-03-01', '2024-03-31', 4800),
    (84, 84, 19, '2024-04-01', '2024-04-30', 9600),
    (85, 85, 20, '2024-05-01', '2024-05-31', 14400),

    -- 150 Mbps Plans
    (86, 86, 21, '2024-01-01', '2024-01-31', 900),
    (87, 87, 22, '2024-02-01', '2024-02-29', 2700),
    (88, 88, 23, '2024-03-01', '2024-03-31', 5400),
    (89, 89, 24, '2024-04-01', '2024-04-30', 10800),
    (90, 90, 25, '2024-05-01', '2024-05-31', 16200),

    -- 200 Mbps Plans
    (91, 91, 26, '2024-01-01', '2024-01-31', 999),
    (92, 92, 27, '2024-02-01', '2024-02-29', 3000),
    (93, 93, 28, '2024-03-01', '2024-03-31', 6000),
    (94, 94, 29, '2024-04-01', '2024-04-30', 12000),
    (95, 95, 30, '2024-05-01', '2024-05-31', 18000),

    -- Repeating this pattern for user IDs 96 to 300
    (96, 96, 1, '2024-01-01', '2024-01-31', 550),
    (97, 97, 2, '2024-02-01', '2024-02-29', 1650),
    (98, 98, 3, '2024-03-01', '2024-03-31', 3300),
    (99, 99, 4, '2024-04-01', '2024-04-30', 6600),
    (100, 100, 5, '2024-05-01', '2024-05-31', 9900),

    (101, 101, 6, '2024-01-01', '2024-01-31', 600),
    (102, 102, 7, '2024-02-01', '2024-02-29', 1800),
    (103, 103, 8, '2024-03-01', '2024-03-31', 3600),
    (104, 104, 9, '2024-04-01', '2024-04-30', 7200),
    (105, 105, 10, '2024-05-01', '2024-05-31', 10800),

    (106, 106, 11, '2024-01-01', '2024-01-31', 700),
    (107, 107, 12, '2024-02-01', '2024-02-29', 2100),
    (108, 108, 13, '2024-03-01', '2024-03-31', 4200),
    (109, 109, 14, '2024-04-01', '2024-04-30', 8400),
    (110, 110, 15, '2024-05-01', '2024-05-31', 12600),

    (111, 111, 16, '2024-01-01', '2024-01-31', 800),
    (112, 112, 17, '2024-02-01', '2024-02-29', 2400),
    (113, 113, 18, '2024-03-01', '2024-03-31', 4800),
    (114, 114, 19, '2024-04-01', '2024-04-30', 9600),
    (115, 115, 20, '2024-05-01', '2024-05-31', 14400),

    (116, 116, 21, '2024-01-01', '2024-01-31', 900),
    (117, 117, 22, '2024-02-01', '2024-02-29', 2700),
    (118, 118, 23, '2024-03-01', '2024-03-31', 5400),
    (119, 119, 24, '2024-04-01', '2024-04-30', 10800),
    (120, 120, 25, '2024-05-01', '2024-05-31', 16200),

    (121, 121, 26, '2024-01-01', '2024-01-31', 999),
    (122, 122, 27, '2024-02-01', '2024-02-29', 3000),
    (123, 123, 28, '2024-03-01', '2024-03-31', 6000),
    (124, 124, 29, '2024-04-01', '2024-04-30', 12000),
    (125, 125, 30, '2024-05-01', '2024-05-31', 18000),

    (126, 126, 1, '2024-01-01', '2024-01-31', 550),
    (127, 127, 2, '2024-02-01', '2024-02-29', 1650),
    (128, 128, 3, '2024-03-01', '2024-03-31', 3300),
    (129, 129, 4, '2024-04-01', '2024-04-30', 6600),
    (130, 130, 5, '2024-05-01', '2024-05-31', 9900),

    -- Continue this pattern up to user_id 300
    (131, 131, 6, '2024-01-01', '2024-01-31', 600),
    (132, 132, 7, '2024-02-01', '2024-02-29', 1800),
    (133, 133, 8, '2024-03-01', '2024-03-31', 3600),
    (134, 134, 9, '2024-04-01', '2024-04-30', 7200),
    (135, 135, 10, '2024-05-01', '2024-05-31', 10800),

    (136, 136, 11, '2024-01-01', '2024-01-31', 700),
    (137, 137, 12, '2024-02-01', '2024-02-29', 2100),
    (138, 138, 13, '2024-03-01', '2024-03-31', 4200),
    (139, 139, 14, '2024-04-01', '2024-04-30', 8400),
    (140, 140, 15, '2024-05-01', '2024-05-31', 12600),

    (141, 141, 16, '2024-01-01', '2024-01-31', 800),
    (142, 142, 17, '2024-02-01', '2024-02-29', 2400),
    (143, 143, 18, '2024-03-01', '2024-03-31', 4800),
    (144, 144, 19, '2024-04-01', '2024-04-30', 9600),
    (145, 145, 20, '2024-05-01', '2024-05-31', 14400),

    (146, 146, 21, '2024-01-01', '2024-01-31', 900),
    (147, 147, 22, '2024-02-01', '2024-02-29', 2700),
    (148, 148, 23, '2024-03-01', '2024-03-31', 5400),
    (149, 149, 24, '2024-04-01', '2024-04-30', 10800),
    (150, 150, 25, '2024-05-01', '2024-05-31', 16200),

    (151, 151, 26, '2024-01-01', '2024-01-31', 999),
    (152, 152, 27, '2024-02-01', '2024-02-29', 3000),
    (153, 153, 28, '2024-03-01', '2024-03-31', 6000),
    (154, 154, 29, '2024-04-01', '2024-04-30', 12000),
    (155, 155, 30, '2024-05-01', '2024-05-31', 18000),

    (156, 156, 1, '2024-01-01', '2024-01-31', 550),
    (157, 157, 2, '2024-02-01', '2024-02-29', 1650),
    (158, 158, 3, '2024-03-01', '2024-03-31', 3300),
    (159, 159, 4, '2024-04-01', '2024-04-30', 6600),
    (160, 160, 5, '2024-05-01', '2024-05-31', 9900),

    (161, 161, 6, '2024-01-01', '2024-01-31', 600),
    (162, 162, 7, '2024-02-01', '2024-02-29', 1800),
    (163, 163, 8, '2024-03-01', '2024-03-31', 3600),
    (164, 164, 9, '2024-04-01', '2024-04-30', 7200),
    (165, 165, 10, '2024-05-01', '2024-05-31', 10800),

    (166, 166, 11, '2024-01-01', '2024-01-31', 700),
    (167, 167, 12, '2024-02-01', '2024-02-29', 2100),
    (168, 168, 13, '2024-03-01', '2024-03-31', 4200),
    (169, 169, 14, '2024-04-01', '2024-04-30', 8400),
    (170, 170, 15, '2024-05-01', '2024-05-31', 12600),

    (171, 171, 16, '2024-01-01', '2024-01-31', 800),
    (172, 172, 17, '2024-02-01', '2024-02-29', 2400),
    (173, 173, 18, '2024-03-01', '2024-03-31', 4800),
    (174, 174, 19, '2024-04-01', '2024-04-30', 9600),
    (175, 175, 20, '2024-05-01', '2024-05-31', 14400),

    (176, 176, 21, '2024-01-01', '2024-01-31', 900),
    (177, 177, 22, '2024-02-01', '2024-02-29', 2700),
    (178, 178, 23, '2024-03-01', '2024-03-31', 5400),
    (179, 179, 24, '2024-04-01', '2024-04-30', 10800),
    (180, 180, 25, '2024-05-01', '2024-05-31', 16200),

    (181, 181, 26, '2024-01-01', '2024-01-31', 999),
    (182, 182, 27, '2024-02-01', '2024-02-29', 3000),
    (183, 183, 28, '2024-03-01', '2024-03-31', 6000),
    (184, 184, 29, '2024-04-01', '2024-04-30', 12000),
    (185, 185, 30, '2024-05-01', '2024-05-31', 18000),

    (186, 186, 1, '2024-01-01', '2024-01-31', 550),
    (187, 187, 2, '2024-02-01', '2024-02-29', 1650),
    (188, 188, 3, '2024-03-01', '2024-03-31', 3300),
    (189, 189, 4, '2024-04-01', '2024-04-30', 6600),
    (190, 190, 5, '2024-05-01', '2024-05-31', 9900),

    (191, 191, 6, '2024-01-01', '2024-01-31', 600),
    (192, 192, 7, '2024-02-01', '2024-02-29', 1800),
    (193, 193, 8, '2024-03-01', '2024-03-31', 3600),
    (194, 194, 9, '2024-04-01', '2024-04-30', 7200),
    (195, 195, 10, '2024-05-01', '2024-05-31', 10800),

    (196, 196, 11, '2024-01-01', '2024-01-31', 700),
    (197, 197, 12, '2024-02-01', '2024-02-29', 2100),
    (198, 198, 13, '2024-03-01', '2024-03-31', 4200),
    (199, 199, 14, '2024-04-01', '2024-04-30', 8400),
    (200, 200, 15, '2024-05-01', '2024-05-31', 12600);

    


INSERT INTO Notifications (notification_id, user_id, message, notification_date, status)
VALUES
    (1, 101, 'You have successfully subscribed to the 50 Mbps Plan - 30 Days.', '2024-01-10', 'Sent'),
    (2, 102, 'Your 60 Mbps Plan - 90 Days is now active. Enjoy high-speed internet!', '2024-01-12', 'Sent'),
    (3, 103, 'Reminder: Your 50 Mbps Plan - 180 Days will renew on 2024-01-31.', '2024-01-25', 'Sent'),
    (4, 101, 'Your 70 Mbps Plan - 365 Days has been successfully activated.', '2024-01-15', 'Sent'),
    (5, 102, 'Notice: Your 100 Mbps Plan - 30 Days is set to expire on 2024-02-10.', '2024-01-20', 'Sent'),
    (6, 103, 'Important: Your 150 Mbps Plan - 90 Days will be auto-renewed soon.', '2024-01-22', 'Sent'),
    (7, 104, 'You have upgraded to the 200 Mbps Plan - 180 Days. Welcome aboard!', '2024-01-18', 'Sent'),
    (8, 105, 'Your 100 Mbps Plan - 365 Days is now active. Enjoy unlimited browsing!', '2024-01-19', 'Sent'),
    (9, 106, 'Reminder: Your 150 Mbps Plan - 30 Days is due for renewal on 2024-02-01.', '2024-01-24', 'Sent'),
    (10, 101, 'You are now subscribed to the 50 Mbps Plan - 90 Days.', '2024-01-28', 'Sent'),
    (11, 102, 'Your 60 Mbps Plan - 180 Days is active. Enjoy your service!', '2024-01-30', 'Sent'),
    (12, 103, 'Your 70 Mbps Plan - 30 Days will expire soon. Consider renewing!', '2024-02-01', 'Sent'),
    (13, 104, 'You have successfully subscribed to the 100 Mbps Plan - 90 Days.', '2024-02-05', 'Sent'),
    (14, 105, 'Your 150 Mbps Plan - 180 Days is now active. Enjoy high-speed access!', '2024-02-07', 'Sent'),
    (15, 106, 'Notice: Your 200 Mbps Plan - 30 Days is set to expire on 2024-02-15.', '2024-02-10', 'Sent'),
    (16, 101, 'Reminder: Your 50 Mbps Plan - 540 Days is active. No interruptions!', '2024-02-12', 'Sent'),
    (17, 102, 'You have successfully activated the 60 Mbps Plan - 30 Days.', '2024-02-13', 'Sent'),
    (18, 103, 'Your 70 Mbps Plan - 90 Days is now active. Enjoy seamless connectivity!', '2024-02-14', 'Sent'),
    (19, 104, 'Notice: Your 100 Mbps Plan - 180 Days will renew on 2024-02-20.', '2024-02-15', 'Sent'),
    (20, 105, 'Your 150 Mbps Plan - 365 Days has been activated successfully!', '2024-02-17', 'Sent'),
    (21, 106, 'Important: Your 200 Mbps Plan - 540 Days is now active.', '2024-02-18', 'Sent'),
    (22, 101, 'Your 50 Mbps Plan - 30 Days will auto-renew on 2024-03-01.', '2024-02-20', 'Sent'),
    (23, 102, 'Reminder: Your 60 Mbps Plan - 90 Days will expire soon. Please review.', '2024-02-25', 'Sent'),
    (24, 103, 'You have successfully subscribed to the 70 Mbps Plan - 180 Days.', '2024-02-28', 'Sent'),
    (25, 104, 'Your 100 Mbps Plan - 30 Days is due for renewal on 2024-03-05.', '2024-03-01', 'Sent'),
    (26, 105, 'Your 150 Mbps Plan - 90 Days is now active. Thank you for choosing us!', '2024-03-02', 'Sent'),
    (27, 106, 'Notice: Your 200 Mbps Plan - 180 Days will be auto-renewed soon.', '2024-03-03', 'Sent'),
    (28, 101, 'Your 50 Mbps Plan - 90 Days is set to expire on 2024-03-10.', '2024-03-04', 'Sent'),
    (29, 102, 'Your 60 Mbps Plan - 30 Days is now active. Enjoy high-speed internet!', '2024-03-05', 'Sent'),
    (30, 103, 'Reminder: Your 70 Mbps Plan - 365 Days will renew on 2024-03-15.', '2024-03-08', 'Sent'),
    (31, 104, 'You have successfully subscribed to the 100 Mbps Plan - 540 Days!', '2024-03-10', 'Sent'),
    (32, 105, 'Your 150 Mbps Plan - 30 Days is now active. Welcome aboard!', '2024-03-12', 'Sent'),
    (33, 106, 'Notice: Your 200 Mbps Plan - 90 Days is set to expire on 2024-03-20.', '2024-03-15', 'Sent'),
    (34, 101, 'Your 50 Mbps Plan - 540 Days is now active. Enjoy seamless browsing!', '2024-03-18', 'Sent'),
    (35, 102, 'Reminder: Your 60 Mbps Plan - 180 Days will renew on 2024-03-25.', '2024-03-20', 'Sent'),
    (36, 103, 'Your 70 Mbps Plan - 30 Days is set to expire on 2024-04-01. Please renew!', '2024-03-25', 'Sent'),
    (37, 104, 'Your 100 Mbps Plan - 90 Days will auto-renew on 2024-04-05.', '2024-03-26', 'Sent'),
    (38, 105, 'Reminder: Your 150 Mbps Plan - 180 Days will expire on 2024-04-10.', '2024-03-27', 'Sent'),
    (39, 106, 'You have successfully activated the 200 Mbps Plan - 30 Days. Enjoy!', '2024-03-28', 'Sent'),
    (40, 101, 'Notice: Your 50 Mbps Plan - 365 Days will be auto-renewed soon.', '2024-03-30', 'Sent'),
    (41, 102, 'Your 60 Mbps Plan - 540 Days is active. Enjoy long-term connectivity!', '2024-04-01', 'Sent'),
    (42, 103, 'Important: Your 70 Mbps Plan - 180 Days will renew on 2024-04-15.', '2024-04-02', 'Sent'),
    (43, 104, 'Your 100 Mbps Plan - 365 Days is set to expire on 2024-04-20. Renew soon.', '2024-04-05', 'Sent'),
    (44, 105, 'You are now subscribed to the 150 Mbps Plan - 540 Days.', '2024-04-07', 'Sent'),
    (45, 106, 'Reminder: Your 200 Mbps Plan - 180 Days is active until 2024-09-30.', '2024-04-10', 'Sent'),
    (46, 101, 'Your 50 Mbps Plan - 90 Days is due for renewal on 2024-05-01.', '2024-04-15', 'Sent'),
    (47, 102, 'You have successfully subscribed to the 60 Mbps Plan - 30 Days.', '2024-04-16', 'Sent'),
    (48, 103, 'Your 70 Mbps Plan - 540 Days is now active. Enjoy your extended service!', '2024-04-18', 'Sent'),
    (49, 104, 'Notice: Your 100 Mbps Plan - 180 Days will renew on 2024-05-10.', '2024-04-20', 'Sent'),
    (50, 105, 'Your 150 Mbps Plan - 30 Days is set to expire soon. Renew to continue.', '2024-04-22', 'Sent');

-- Questions --    
-- 1.
ALTER TABLE invoice
RENAME COLUMN status TO payment_status; 

-- Calculating the total revenue from invoices -- Arithmetic Operators
SELECT SUM(amount) AS total_revenue FROM Invoice;

-- Finding users with plans that have a speed  of 50 . -- Comparison Operators
SELECT * FROM Users
WHERE plan_id IN (SELECT plan_id FROM Plans WHERE speed = 50) limit 5;

-- Single query
-- Get the total number of cancelled subscriptions.
SELECT COUNT(*) AS active_subscriptions FROM Subscriptions WHERE status = 'Cancelled';

-- Retrieve all invoices that are overdue.
SELECT * FROM Invoice WHERE due_date < CURRENT_DATE AND payment_status  = 'Unpaid';

-- Count the number of support tickets created by each user.
SELECT user_id, COUNT(*) AS ticket_count FROM SupportTickets GROUP BY user_id;

-- List all technicians serving in a specific area (e.g., 'Mumbai').
SELECT * FROM Technicians WHERE area_served = 'Mumbai';

-- Double Query
-- Get the subscription IDs for users who have made a payment greater than the average payment amount..
SELECT subscription_id FROM Subscriptions 
WHERE user_id IN (
    SELECT user_id FROM Payments 
    WHERE amount > (SELECT AVG(amount) FROM Payments)
) limit 10;

-- which user who taken 90 day plan ?
SELECT u.user_id, u.full_name, p.plan_name, p.price
FROM Users u
JOIN Plans p ON u.plan_id = p.plan_id
WHERE p.plan_name = '60 Mbps Plan - 90 Days'  -- Ensure no trailing spaces in the plan name
LIMIT 15;


-- which user who taken 30 day plan ?
SELECT u.user_id, u.full_name, p.plan_name, p.price
FROM Users u
JOIN Plans p ON u.plan_id = p.plan_id
WHERE p.duration = 30 limit 5;

 
-- Finding users with either a 'Cancelled' subscription status or a support ticket status of 'Open'. 
-- Logical Operators
SELECT * FROM Users
WHERE user_id IN (SELECT user_id FROM Subscriptions WHERE status = 'Cancelled')
   OR user_id IN (SELECT user_id FROM SupportTickets WHERE status = 'Open') limit 10;
   
-- Finding all invoices with due dates between two dates -- Between Operator
SELECT * FROM Invoice
WHERE due_date BETWEEN '2024-02-01' AND '2024-02-28';   

-- Finding users with names starting with 'J'. -- Like Operator
SELECT * FROM Users
WHERE full_name LIKE 'J%';

-- Ordering users by registration date. -- Order By Clause
SELECT * FROM Users
ORDER BY registration_date DESC limit 10;

-- Calculating the average price of plans.
SELECT AVG(price) AS average_price FROM Plans;

-- Grouping the total data used by each user. -- Group By Clause
SELECT user_id, SUM(data_used) AS total_data_used
FROM UsageHistory
GROUP BY user_id;

-- Filtering the group to only show users who have used more than 10 GB of data. -- Having Clause
SELECT user_id, SUM(data_used) AS total_data_used
FROM UsageHistory
GROUP BY user_id
HAVING SUM(data_used) > 10;

-- Getting the user who has the highest total amount in invoices.
SELECT invoice_id 
FROM Invoice 
WHERE amount = (SELECT MAX(amount) FROM Invoice);


-- Get all notifications for the user with user_id = 101.
SELECT * FROM Notifications 
WHERE user_id = 101;

-- Fetch 10  users along with their subscription details (plan name and status).
SELECT u.user_id, u.full_name, p.plan_name, s.status
FROM Users u
JOIN Subscriptions s ON u.user_id = s.user_id
JOIN Plans p ON s.plan_id = p.plan_id limit 10;

-- Get a list of active users along with their data usage history.
SELECT u.user_id, u.full_name, uh.date, uh.data_used
FROM Users u
JOIN Subscriptions s ON u.user_id = s.user_id
JOIN UsageHistory uh ON u.user_id = uh.user_id
WHERE s.status = 'Active';

-- Calculate the total revenue generated from all paid invoices.
SELECT SUM(amount) AS total_revenue
FROM Invoice
WHERE payment_status = 'Paid';
 
-- Count the number of support tickets grouped by their status.
SELECT status, COUNT(*) AS ticket_count
FROM SupportTickets
GROUP BY status;

-- Retrieve recent payments made, showing the payment method and status.
SELECT p.payment_id, p.amount, p.payment_date, p.payment_method, p.status
FROM Payments p
ORDER BY p.payment_date DESC
LIMIT 10;

-- Find 15 users who do not have any active subscriptions.
SELECT u.user_id, u.full_name
FROM Users u
LEFT JOIN Subscriptions s ON u.user_id = s.user_id AND s.status = 'Active'
WHERE s.subscription_id IS NULL limit 15;

-- Get a list of 5  technicians and their upcoming service appointments.
SELECT t.technician_id, t.full_name, sa.service_date, sa.service_type
FROM Technicians t
JOIN ServiceAppointments sa ON t.technician_id = sa.technician_id
WHERE sa.status = 'Scheduled' limit 5;

-- Get a summary of billing details for a specific user.
SELECT b.bill_id, b.billing_period_start, b.billing_period_end, b.total_amount
FROM Billing b
JOIN Users u ON b.user_id = u.user_id
WHERE u.user_id = 101;

-- Find subscriptions that are about to expire within the next 30 days.
SELECT s.subscription_id, u.full_name, p.plan_name, s.end_date
FROM Subscriptions s
JOIN Users u ON s.user_id = u.user_id
JOIN Plans p ON s.plan_id = p.plan_id
WHERE s.end_date BETWEEN CURDATE() AND DATE_ADD(CURDATE(), INTERVAL 30 DAY);

-- Get a list of invoices that are overdue for payment.
SELECT i.invoice_id, u.full_name, i.invoice_date, i.due_date, i.amount
FROM Invoice i
JOIN Subscriptions s ON i.subscription_id = s.subscription_id
JOIN Users u ON s.user_id = u.user_id
WHERE i.due_date < CURDATE() AND i.payment_status != 'Paid' limit 10;

-- Which plans and prices are associated with the user 'Raj Kumar,' price in desc orders ?

SELECT u.user_id, u.full_name, p.plan_name AS "Plan Name", p.price AS "Plan Price"
FROM Users u
JOIN Plans p ON u.plan_id = p.plan_id
WHERE u.full_name = 'Raj Kumar'
GROUP BY u.user_id, u.full_name, p.plan_name, p.price
ORDER BY p.price DESC;

-- which ticket status are in procss
SELECT * FROM SupportTickets
WHERE status = 'In Progress';

-- Which ticket are open of the users in process'?
SELECT st.ticket_id, st.issue_description, st.status, st.created_date, st.resolved_date, u.full_name
FROM SupportTickets st
JOIN Users u ON st.user_id = u.user_id
WHERE st.status = 'In Progress';

-- which techniction is assign to which user ?
SELECT ta.appointment_id, u.full_name AS user_name, t.full_name AS technician_name, ta.service_date
FROM ServiceAppointments ta
JOIN Users u ON ta.user_id = u.user_id
JOIN Technicians t ON ta.technician_id = t.technician_id
where service_type = 'Repair';
