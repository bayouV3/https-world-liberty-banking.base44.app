## PayPal Integration

### Prerequisites
- Ensure you have a PayPal Developer Account.
- Node.js installed (version X.X.X or higher).

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

This section provides the essential information needed to integrate PayPal successfully into the World Liberty Banking App.