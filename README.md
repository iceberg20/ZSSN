# README

##API Documentation

URL = https://zssn-italo.herokuapp.com

###Creat Survivor

URL: /survivors

Method: POST

Params:
```ruby
{  
   "survivor":{  
      "name":"Michonne",
      "age":"19",
      "gender":"Female",
      "lat":"10",
      "long":"20",
      "infected_reports":"0"
   }
}

Exemple: curl -H "Content-Type: application/json" -X POST -d '{"survivor": {"name": "Rick Grimmes", "age": "30", "gender": "Male", "lat": "10", "long": "20","infected_reports": "0"}}' https://zssn-italo.herokuapp.comreport_infection/survivors
```

###List Survivors

URL: /survivors

Method: GET

###Report Infection

URL: /report_infection/:id

Method: PATCH

Exemple: curl -X PATCH https://zssn-italo.herokuapp.comreport_infection/1











