#!/bin/bash
# World Liberty Banking App - Startup Script

set -e  # Exit on any error

echo "================================================"
echo "  World Liberty Banking App - Startup Script"
echo "================================================"
echo ""

# Check if Node.js is installed
if ! command -v node &> /dev/null; then
    echo "❌ Error: Node.js is not installed."
    echo "Please install Node.js from https://nodejs.org/"
    exit 1
fi

echo "✓ Node.js version: \\$(node -v)"

# Check if npm is installed
if ! command -v npm &> /dev/null; then
    echo "❌ Error: npm is not installed."
    exit 1
fi

echo "✓ npm version: \\$(npm -v)"
echo ""

# Check if .env file exists
if [ ! -f .env ]; then
    echo "⚠ Warning: .env file not found!"
    echo "Creating .env file with default values..."
    cat > .env << EOF
DB_URI=mongodb://localhost:27017/world_liberty_banking
PORT=3000
NODE_ENV=development
PAYPAL_CLIENT_ID=your_paypal_client_id
PAYPAL_CLIENT_SECRET=your_paypal_client_secret
EOF
    echo "✓ .env file created. Please update it with your actual values."
    echo ""
fi

# Install dependencies if node_modules doesn't exist
if [ ! -d "node_modules" ]; then
    echo "📦 Installing dependencies..."
    npm install
    echo "✓ Dependencies installed"
    echo ""
fi

# Check if MongoDB is running (optional warning)
if ! command -v mongod &> /dev/null; then
    echo "⚠ Warning: MongoDB doesn't appear to be installed or in PATH"
    echo "Make sure MongoDB is running on mongodb://localhost:27017/"
    echo ""
fi

# Start the application
echo "🚀 Starting World Liberty Banking App..."
echo "================================================"
echo ""
npm start
