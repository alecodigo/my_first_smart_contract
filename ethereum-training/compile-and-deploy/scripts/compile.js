/* Importamos librerias:
path para trabajar con rutas
fs para poder trabajar con ficheros en disco
solc para importar el compilador de solidity
*/
const path = require('path');
const fs = require('fs');
const solc = require('solc');
const chalk = require('chalk');


const contractPath = path.resolve(__dirname, "../contracts", "UsersContract.sol");
// leemos el archivo de manera sincrona 
const source = fs.readFileSync(contractPath, 'utf8');


console.log(source);

//const { interface, bytecode } = solc.compile(source, 1).contracts[':UsersContract'];


console.log(chalk.green(bytecode));
console.log(chalk.cyan(interface));