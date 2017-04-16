% Twilio SMS Wrapper for MATLAB
% Developer: Benjamin P. Corn
% Version: 1.0.0 04/16/17

classdef TwilioClient < handle
   properties
      AccountSID
      AuthToken
   end
   
   methods
       function client = TwilioClient(sid, token)
            client.AccountSID = sid;
            client.AuthToken = token;
       end
       
       function msg = SendMessage(obj, to, from, body)
            endpoint = sprintf('https://api.twilio.com/2010-04-01/Accounts/%s/Messages.json',obj.AccountSID);
            
            opt = weboptions();
            opt.Username = obj.AccountSID;
            opt.Password = obj.AuthToken;
            
            try
                msg = webwrite(endpoint, 'To', to, 'From', from, 'Body', body, opt);
            catch err
                msg = err.message;
            end
       end
       
       function num = FormatNumber(~, number, country_code)
            number(number == ' ') = '';
            number(number == '-') = '';
            number(number == '.') = '';
            num = strcat('+',country_code, number);
       end
   end   
end