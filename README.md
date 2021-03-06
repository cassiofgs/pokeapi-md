# README

Application developed with Ruby version 2.7.2 and Rails 6.1.3.1

Please run ```bundle install```, ```rails db:migrate``` and ```rails db:seed``` before run the application

If you need to run the unit tests, please also run ```rails db:migrate RAILS_ENV=test``` before executing the ```rspec``` command

# Object
The Pokemon object has all attributes bellow, at the side of each one there is a list of validations performed on them.

- "pokedex_number": Mandatory, has to be a number and has to be greater than 0.
- "name": Mandatory, has to be unique.
- "type_1": Mandatory.
- "type_2": Optional.
- "total": Mandatory, has to be a number, has to be greater than 0 and has to be exactly the sum of (hp, attack, defense, sp_atk, sp_def and speed).
- "hp": Mandatory, has to be a number and has to be greater than 0.
- "attack": Mandatory, has to be a number and has to be greater than 0.
- "defense": Mandatory, has to be a number and has to be greater than 0.
- "sp_atk": Mandatory, has to be a number and has to be greater than 0.
- "sp_def": Mandatory, has to be a number and has to be greater than 0.
- "speed": Mandatory, has to be a number and has to be greater than 0.
- "generation": Mandatory, has to be a number and has to be greater than 0.
- "legendary": Mandatory, has to be either true or false.

# Routes

List of all pokemon paginated:
- GET ```/pokemons```
- GET ```/pokemons?page[number]=2&page[size]=50```

Get a single pokemon by id:
- GET ```/pokemons/:id```

Get a list of pokemons related by their pokedex number:
- GET ```/pokemons/pokedex/:pokedex_number```
- Some pokemons have more than one "form" and they are all classified under the same pokedex number, with this endpoint you can retrieve all forms for a specific pokemon based on their pokedex number.
```
{
    "data": [
        {
            "id": "3",
            "type": "pokemon",
            "attributes": {
                "pokedex_number": 3,
                "name": "Venusaur",
                "type_1": "Grass",
                "type_2": "Poison",
                "total": 525,
                "hp": 80,
                "attack": 82,
                "defense": 83,
                "sp_atk": 100,
                "sp_def": 100,
                "speed": 80,
                "generation": 1,
                "legendary": false
            }
        },
        {
            "id": "4",
            "type": "pokemon",
            "attributes": {
                "pokedex_number": 3,
                "name": "VenusaurMega Venusaur",
                "type_1": "Grass",
                "type_2": "Poison",
                "total": 625,
                "hp": 80,
                "attack": 100,
                "defense": 123,
                "sp_atk": 122,
                "sp_def": 120,
                "speed": 80,
                "generation": 1,
                "legendary": false
            }
        }
    ]
}
```

Create a pokemon:
- POST ```/pokemons```
- All mandatory attributes need to be sent:
```
{
    "data": {
        "attributes": {
            "pokedex_number": 9999,
            "name": "MissingNo",
            "type_1": "Normal",
            "type_2": "Psychic",
            "total": 300,
            "hp": 50,
            "attack": 50,
            "defense": 50,
            "sp_atk": 50,
            "sp_def": 50,
            "speed": 50,
            "generation": 1,
            "legendary": true
        }
    }
}
```

Update a pokemon:
- PUT ```/pokemons/:id```
- PATCH ```/pokemons/:id```
- Only the attributes that will be updated need to be sent:
```
{
    "data": {
        "attributes": {
            "pokedex_number": 9999,
            "name": "MissingNo",
            "type_1": "Normal",
            "type_2": "Water"
        }
    }
}
```

Delete a pokemon
- DELETE ```/pokemons/:id```

# Unit Tests
Unit tests where written using Rspec, execute one of the following commands

To execute all tests togheter:
```rspec```

To execute model tests only:
```rspec spec/models/pokemon_spec.rb```

To execute requests tests only:
```rspec spec/requests/pokemons_spec.rb```

To execute routing tests only:
```rspec spec/routing/pokemons_spec.rb```
