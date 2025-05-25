# Bypass

**Bypass** is a smart access control system designed to manage and monitor student entry and exit in educational environments. Initially supported by IFPR, the project is now independently maintained and aims to deliver an affordable and scalable solution for secure, automated turnstile access.

## 🔍 Overview

Bypass combines an ESP32 microcontroller, RFID technology, and a web-based interface to create a low-cost, intelligent gate control prototype. The goal is to help schools track attendance, control access permissions, and ensure student safety through modern automation.

## 🚀 Features

- 🧾 **RFID-based user identification**
- 🔐 **Access control** with permission levels
- 📈 **Real-time logging** of entry and exit events (via MySQL, in development)
- 🌐 **Web interface** for admins to view and manage data
- ⚙️ **Servo motor-based prototype** simulating a real turnstile
- 📡 Scalable for future integration with remote dashboards and analytics

## 🧠 Technologies Used

- **Microcontroller:** ESP32
- **Identification:** RFID (MFRC522 module)
- **Database:** MySQL (in development)
- **Frontend:** HTML, CSS, JavaScript
- **Backend:** PHP and Node.js (planned)
- **Other Components:** Servo motor, buzzer, LEDs

## ⚙️ How It Works

1. A student presents their RFID card to the reader.
2. The ESP32 reads the tag and checks access validity.
3. If authorized, the servo motor simulates turnstile rotation.
4. Entry or exit is logged (to local memory or MySQL when implemented).
5. Admins can review data through the web interface.


## 🌐 Use Cases

- Public and private schools
- Technical institutes
- Corporate buildings
- Small-scale event control

## 📅 Roadmap

- [x] ESP32 + RFID prototype with servo control
- [x] Start of web interface development
- [ ] MySQL database integration
- [ ] Admin dashboard with login and user management
- [ ] Real turnstile hardware implementation
- [ ] Deployment-ready version for institutions

## 🛠️ Installation

_Installation instructions and wiring diagrams will be added as the system matures._

## 🤝 Contributing

Although the project is currently maintained solo, contributions are welcome!  
Feel free to fork, open issues, or submit pull requests to improve the project.

## 👤 Author

**Felipe Buche**  
📧 felipe.buche.tds2023@gmail.com

---

**Bypass** is more than just a gate — it's a step towards smarter, safer, and more efficient school environments.
