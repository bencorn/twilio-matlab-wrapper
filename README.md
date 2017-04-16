# twilio-matlab-wrapper
A Twilio SMS client for MATLAB.

## General Usage
### Step 1 - Basic Authentication

client = TwilioClient('AccountSID', 'AuthToken');

You can find your Account SID and AuthToken from the Twilio Console.

### Step 2 - Send Message

client.SendMessage('TO','FROM','This is a test SMS message sent from Twilio');

The To and From phone number must be formatted with the country code at the beginning. For example:

888 999 9898 -> +18889999898  

All numbers must include the country code and no spaces, hyphens, dashes, periods, etc. should exist in the number.

There is a FormatNumber method in the TwilioClient to help handle basic formatting. This will remove periods, dashes, and spaces and append the country code to the front of the number.

client.FormatNumber('8889998989', '1'); -> +18889998989
