const of = require('await-of').default;
const fs = require('fs');
const faker = require('faker');

const NEW_LINE = '\n';
const DEFAULT_FILE_ENCODING = 'utf8';
const NULL_VALUE = 'NULL';

const INSERT_START_LINE = 'INSERT INTO';
const INSERT_REGEX = /INSERT INTO (.*?) \((.*?)\) VALUES \((.*?)\);/i;

const VALUE_TYPES = {
    empty: 'empty',
    null: 'NULL',
    value: 'value',
};

function getMatches(line = '', regex) {
    return regex.exec(line) || [];
}

function processValue(value = '', config = {}) {
    const { type, value: configValue, excludeValues = [], isString = false } = config;
    let newValue;

    if (excludeValues.includes(value)) {
        return value;
    }

    if (type.includes('faker')) {
        const execPath = type.split('.');
        if (execPath.length !== 3) {
            return '';
        }

        const subType = faker[execPath[1]] || {};
        const func = subType[execPath[2]];

        if (!func) {
            return '';
        }

        try {
            newValue = func();
            return isString ? `'${newValue}'` : newValue;
        } catch (error) {
            console.error(error);
            return '';
        }
    }

    const valueMap = {
        [VALUE_TYPES.empty]: '',
        [VALUE_TYPES.null]: NULL_VALUE,
        [VALUE_TYPES.value]: configValue,
    };

    newValue = valueMap[type] || '';
    newValue = isString ? `'${newValue}'` : newValue;

    return newValue || value;
}

function processContent(content = '', config = {}) {
    const lines = content.split(NEW_LINE);

    let modifiedResult = [];

    for (let line of lines) {
        if (!line.startsWith(INSERT_START_LINE)) {
            modifiedResult.push(line);
            continue;
        }

        const matches = getMatches(line, INSERT_REGEX);
        if (matches.length !== 4) {
            modifiedResult.push(line);
            continue;
        }

        const [, tableName, columnsStr, valuesStr] = matches;
        const columns = columnsStr.split(',').map(value => value.trim());
        const values = valuesStr.split(',').map(value => value.trim());

        const tableSettings = config[tableName];

        if (!tableSettings) {
            modifiedResult.push(line);
            continue;
        }

        let newValues = [];
        for (let i = 0, len = columns.length; i < len; i++) {
            const columnSetting = tableSettings[columns[i]];

            if (!columnSetting) {
                newValues.push(values[i]);
                continue;
            }

            newValues.push(processValue(values[i], columnSetting));
        }

        const newLine = `INSERT INTO ${tableName} (${columnsStr}) VALUES (${newValues.join(', ')})`;
        modifiedResult.push(newLine);
    }

    return modifiedResult.join(NEW_LINE);
}

async function parseConfig(configFilePath) {
    const [content, error] = await of(readFile(configFilePath));
    if (error) {
        throw error;
    }

    return JSON.parse(content);
}

function readFile(filePath) {
    return new Promise((resolve, reject) => {
        fs.readFile(filePath, DEFAULT_FILE_ENCODING, (error, content) => {
            if (error) {
                return reject(error);
            }

            resolve(content);
        });
    });
}

function writeFile(filePath, content) {
    return new Promise((resolve, reject) => {
        fs.writeFile(filePath, content, error => {
            if (error) {
                return reject(error);
            }

            resolve();
        });
    });
}

async function processFile(sqlDumpFile, options = {}) {
    let error;
    let content;
    let config;

    [config, error] = await of(parseConfig(options.config));
    if (error) {
        throw error;
    }

    [content, error] = await of(readFile(sqlDumpFile));
    if (error) {
        throw error;
    }

    const newContent = processContent(content, config);

    const outputFileName = options.output || sqlDumpFile;

    [, error] = await of(writeFile(outputFileName, newContent));
    if (error) {
        throw error;
    }

    return outputFileName;
}

module.exports = processFile;
