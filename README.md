# Setup Instructions for World Liberty Banking App

## Prerequisites
- Ensure you have Node.js installed on your machine.
- Install MongoDB if you will be using it as your database.

## Clone the Repository
```bash
git clone https://github.com/bayouV3/https-world-liberty-banking.base44.app.git
cd https-world-liberty-banking.base44.app
```

## Install Dependencies
```bash
npm install
```

## Configuration
1. Create a `.env` file in the root directory of the project.
2. Add your environment variables including database connection details.
   
Example:
```plaintext
DB_URI=mongodb://localhost:27017/mydb
PORT=3000
```

## Run the Application
```bash
npm start
```

## Access the Application
Open your browser and go to [http://localhost:3000](http://localhost:3000).