# Car Insurance Management System

## Overview
The Car Insurance Management System is a comprehensive database application designed to efficiently manage car insurance policies, claims, and related information. This project demonstrates proficiency in database design, SQL querying, and Python programming.

## Features
- Manage information for cars, owners, policies, drivers, workshops, and claims
- Add, update, delete, and view records in all tables
- Execute custom SQL queries for advanced data retrieval and analysis
- User-friendly command-line interface for easy interaction

## Technologies Used
- Python 3
- MySQL
- mysql-connector-python

## Installation

1. Clone the repository:
   ```
   git clone https://github.com/Nik-code/Car-Insurance-System.git
   ```

2. Install the required dependencies:
   ```
   pip install -r requirements.txt
   ```

3. Set up your MySQL database using the provided schema in `Database-Schema.sql`.

4. Update the database connection details in `connector.py`:
   ```python
   mydb = mysql.connector.connect(
       host="localhost",
       user="your_username",
       password="your_password",
       database="your_database_name"
   )
   ```

## Usage

Run the application using:
```
python connector.py
```

Follow the on-screen prompts to interact with the database.

## Project Structure
- `connector.py`: Main application file with database operations
- `Database-Schema.sql`: SQL schema for creating the database tables
- `ER DIAGRAM.pdf`: Entity-Relationship diagram of the database structure
- `LICENSE`: MIT License file
- `requirements.txt`: List of Python dependencies

## Contributing
Contributions, issues, and feature requests are welcome. Feel free to check [issues page](https://github.com/Nik-code/Car-Insurance-System/issues) if you want to contribute.

## License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Contact
Your Name - [Your Email]

Project Link: [https://github.com/Nik-code/Car-Insurance-System](https://github.com/Nik-code/Car-Insurance-System)