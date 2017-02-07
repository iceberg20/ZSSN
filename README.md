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

Exemple: curl -H "Content-Type: application/json" -X POST -d '{"survivor": {"name": "Rick Grimmes", "age": "30", "gender": "Male", "lat": "10", "long": "20","infected_reports": "0"}}' https://zssn-italo.herokuapp.com/survivors
```

###List Survivors

URL: /survivors

Method: GET

###Report Infection

URL: /report_infection/:id

Method: GET

Exemple: curl -X GET https://zssn-italo.herokuapp.com/report_infection/1


###Add iventory
URL: /inventories

A survivor must be created before.
```ruby
Exemple: curl -H "Content-Type: application/json" -X POST -d '{"inventory": {"water": "1", "food":"3", "medication": "4", "ammunition": "1" }}' https://zssn-italo.herokuapp.com/inventories
```

###Update survivor Location

URL: /update_location/:id/:lat/:long

Method: GET
```ruby
curl -X GET http://localhost:3000/update_location/1/99/88
```










