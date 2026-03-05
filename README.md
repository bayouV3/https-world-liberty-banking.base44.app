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

## PayPal Integration

### Prerequisites
- Ensure you have a PayPal Developer Account.
- Node.js installed (version 12.0.0 or higher).

### Setup Steps
1. Create a PayPal app in the Developer Dashboard.
2. Obtain your Client ID and Secret from the app settings.
3. Install the PayPal SDK using npm:
   ```bash
   npm install @paypal/checkout-server-sdk
   ```
4. Initialize the SDK in your application:
   ```javascript
   const paypal = require('@paypal/checkout-server-sdk');
   const environment = paypal.core.SandboxEnvironment('YOUR_CLIENT_ID', 'YOUR_CLIENT_SECRET');
   const client = new paypal.core.PayPalHttpClient(environment);
   ```

### Environment Variables
- `PAYPAL_CLIENT_ID`: Your PayPal Client ID.
- `PAYPAL_CLIENT_SECRET`: Your PayPal Client Secret.

### Code Examples
#### Create an Order
```javascript
let request = new paypal.orders.OrdersCreateRequest();
request.requestBody({
    "intent": "CAPTURE",
    "purchase_units": [
        {
            "amount": {
                "currency_code": "USD",
                "value": "100.00"
            }
        }
    ]
});

let response = await client.execute(request);
```

#### Capture an Order
```javascript
let request = new paypal.orders.OrdersCaptureRequest(orderID);
request.requestBody({});
let response = await client.execute(request);
```

### Testing PayPal Integration
- Use PayPal's Sandbox environment for testing before going live.
- Test with sandbox credentials in your `.env` file.
- Once ready for production, update credentials to live PayPal credentials.