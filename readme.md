
**A simple REST API created with Flask.**

## Installation & Tests

* `make build`: Build the docker images. There are two of them: the mysql db and the proper app. 

* `make run PORT=8000`: Run the containers and start the application. 

* `make test`: Run the test. 

* `make stop`: Stop both containers.


## API Reference

**Current Endpoints:**

* Get a user balance
* Get a transfer
* Create a transfer

**Get a user balance**

`GET /userbalance/{user_id}` will return the current balance of the user.

**Get a transfer**

`GET /transfer/{transfer_id}` will return the transfer.

**Create a transfer**

`POST /transfer` will create a new transfer.
```json
[
  {
    "from_user_id": 1,
    "to_user_id": 2,
    "amount": 0.01,
    "description": "test",
  }
]
```
This will return `200 OK` with the location of the new transfer. For example:
```json
[
  {
    "location": "http://localhost:8000/api/transfer/4"
  }
]
```

## Todos

* Implement oauth2
* Rate limiting

