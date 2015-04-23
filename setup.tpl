<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8" />
  <title>Otto WifiSetup</title>
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <style type="text/css">
    * { outline: none; }
    body {
      background-color: #789; margin: 0;
      padding: 0; font: 16px/1.4 Helvetica, Arial, sans-serif;
      font: 16px/1.4 Helvetica, Arial, sans-serif;
    }
    div.content {
      width: 800px; margin: 2em auto; padding: 20px 50px;
      background-color: #fff; border-radius: 1em;
    }
    label { display: inline-block; min-width: 7em; }
    input { border: 1px solid #ccc; padding: 0.2em; }
    a:link, a:visited { color: #69c; text-decoration: none; }
    @media (max-width: 700px) {
      body { background-color: #fff; }
      div.content { width: auto; margin: 0 auto; padding: 1em; }
    }
</style>

<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script language="javascript" type="text/javascript">
  jQuery(function() {

    $(document).on('click', '#connect', function() {
      var json_data={ network: $('#network').val(), password: $('#password').val() };
      $.ajax({
        type: 'POST',
        url: '/api/v1/setup',
        data: JSON.stringify(json_data),
        contentType: "application/json; charset=utf-8",
        dataType: 'json',
        success: function(json) {
          $('#result').html(json.result);
          }
          });
      });

  });
var count = 0;
var timer = $.timer(function() {
    $('#counter').html(++count);
    });
timer.set({ time : 1000, autostart : true });
</script>
</head>
<body>
  <div class="content">
    <h1>Otto Wifi Setup</h1>

    <p>
      Otto is currently in setup mode.
      Please select the name of the Wifi network you would like to use
      and enter the password.
    </p>

    <div>
      <label>Network:</label>
      <select id="network">
%for w in wifis:
        <option value="{{w}}">{{w}}</option>
%end
      </select>
    </div>
    <div>
      <label>Password:</label> <input type="password" id="password" />
    </div>
    <div>
      <button type="button" id="connect">Connect</button>
    </div>
    <div>
      <label id="result"></label> 
      Timer executed <span id="counter">0</span> times...
      <span id="wifis">scanning for networks...</span>
    </div>
    

  </div>
</body>
</html>
