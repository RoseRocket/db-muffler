# db-muffler

> Tool to obscure values in your SQL dump file

## Idea

This tool will allow to obscure specific fileds within INSERT statements of your SQL dump file.
Could be a good tool to hide sensitive data or just replace your dev data with more realistic one.

## Installation

Global installation _(suggested)_

```
$ npm i -g db-muffler
$ db-muffler
```

Local installation

```
$ npm install db-muffler
$ node_modules/.bin/db-muffler
```

## Usage

```
Usage
    $ db-muffler <file_path>

Options
    --test, -t    Test run which would not overwrite input file
    --output, -o  Output file where the result will be store. Default value is the input file name
    --config, -c  Config file where developer can store rules on how to obscure DB data. Default value is ./db-muffler.json

Examples
    $ db-muffler ./inputfile.sql
    Will use ./db-muffler.json config file and then will run muffler to obscure
    data and then output the result in inputfile.sql

    $ db-muffler ./inputfile.sql --test
    Will use ./db-muffler.json config file and then will run muffler to obscure
    data and then output the result in stdout

    $ db-muffler ./inputfile.sql -o ./outputfile.sql
    Will use ./db-muffler.json config file and then will run muffler to obscure
    data and then output the result into outputfile.sql

    $ db-muffler ./inputfile.sql -o ./outputfile.sql -c ./config.json
    Will use config.json config file and then will run muffler to obscure
    data and then output the result into outputfile.sql
```

## PostgreSQL cheatsheet to generate SQL dump files

-   To create SQL file for your DB

```
pg_dump db_name -U my_username -h localhost -F c > my.dump
pg_restore -f my.sql my.dump
```

-   To create SQL file for a specific table

```
pg_dump db_name -U my_username -h localhost -F c --column-inserts -a -t public.table_name > my.dump
pg_restore -f my.sql my.dump
```

#### Sample run (local NPM install)

```
./bin/db-muffler ./example/sample.sql -o ./example/output.sql -c ./example/sampleConfig.json
```

#### Quick start example of a config file

```json
{
    "public.users": {
        "password": {
            "type": "empty"
        },
        "email": {
            "type": "faker.internet.email",
            "excludeValues": "myadmin@gmail.com"
        },
        "deleted_at": {
            "type": "null"
        },
        "activated": {
            "type": "value",
            "value": "true"
        },
        "days_online": {
            "type": "faker.random.number"
        },
        "user_avatar": {
            "type": "faker.internet.avatar",
            "isString": true
        }
    }
}
```

### Config file explanation

Config structure:

```
{
    "table_name_1": {
        "column_name_1A": {
            config
        },
        "column_name_1B": {
            config
        },
        "column_name_1C": {
            config
        },
        ...
    },
    "table_name_2": {
        "column_name_2A": {
            config
        },
        "column_name_2B": {
            config
        },
        "column_name_2C": {
            config
        },
        ...
    },
    ...
}
```

Config structure

-   **type** - string instruction on how the value will be replaced with the following possible
    options (**empty** to remove the value, **null** to replace with NULL, **value** to replace with
    a specific value, **faker** to use Faker function. More information is provided below)
-   **excludedValues** - array of values. If the given value is present in this array it would not
    be replaced
-   **value** - only required for the _type_ `value` to replace content with a new value
-   **isString** - value will be a string if this property is true

## Faker available functions

[Faker NPM](https://www.npmjs.com/package/faker)

[Faker API](https://cdn.rawgit.com/Marak/faker.js/master/examples/browser/index.html)

## Future Improvements

1. There are no tests present for this project yet.
2. Work with different types of SQL dumps
3. It would be great to analyze relations between tables and obscure data in multiple tables
   preserving relations
4. Need to add an ability to obscure data in a column based on other columns
5. This library only works with [Faker](https://www.npmjs.com/package/faker) and it is not swappable
6. **excludedValues** are case sensitive comparison. Wpould be great to add an option to have it
   with a non-case-sensitive comparison

## License

MIT license; see [LICENSE](./LICENSE).

(c) 2020 by Rose Rocket
