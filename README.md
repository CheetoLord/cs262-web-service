# cs 262 web service
## What are the (active) URLs for your data service?

<https://monopoly-service-fwb0djd9etgre8cr.eastus2-01.azurewebsites.net/>

/ - hello

/players - gets players

/players/:id - gets a specific player

/playergames - gets every game paired with every player in that game

/playergames/:id - gets every game a specific player is in

## Which of these endpoints implement actions that are idempotent? nullipotent?
These should all be nullipotent, as they are read-only

## Is the service RESTful? If not, why not? If so, what key features make it RESTful.
No, as it does not fulfil the Code On Demand requirement - code is not sent and cannot be sent from the server to the client.


## Is there any evidence in your implementation of an impedance mismatch?
No, there are games and players, and there are players in games. That is the same from server to client.
