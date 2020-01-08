const meow = require('meow');
const dbMuffler = require('./index');

const DEFAULT_CONFIG_FILE_PATH = './db-muffler.json';

const cli = meow(
    `
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
`,
    {
        flags: {
            test: {
                type: 'boolean',
                alias: 't',
                default: false,
            },
            output: {
                type: 'string',
                alias: 'o',
                default: '',
            },
            config: {
                type: 'string',
                alias: 'c',
                default: DEFAULT_CONFIG_FILE_PATH,
            },
        },
    }
);

dbMuffler(cli.input[0], cli.flags)
    .then(outputFileName => console.log(`New SQL file was saved to ${outputFileName}!`))
    .catch(error => console.error(`DB-Muffler Error: ${error}`));
