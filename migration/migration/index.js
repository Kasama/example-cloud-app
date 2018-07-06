const csv = require('csv-parser');
const mysql = require('mysql');
const fs = require('fs');

const file = "TA_PRECOS_MEDICAMENTOS.csv";

databaseConnectionSettings = {
  host     : process.env['DB_HOST'],
  user     : process.env['DB_USER'],
  port     : process.env['DB_PORT'],
  password : process.env['DB_PASSWORD'],
  database : 'medicamentos'
};

csvConfig = {
  raw: false,     // do not decode to utf-8 strings
  separator: ';', // specify optional cell separator
  quote: '"',     // specify optional quote character
  escape: '"',    // specify optional escape character (defaults to quote value)
  newline: '\n',  // specify a newline character
};

function setupDatabase() {
  const connection = mysql.createConnection(databaseConnectionSettings);

  connection.connect();

  connection.query("CREATE TABLE IF NOT EXISTS empresas (NU_CNPJ DOUBLE PRIMARY KEY, NO_RAZAO_SOCIAL LONGTEXT)");
  connection.query("CREATE TABLE IF NOT EXISTS substancias (DS_CAS VARCHAR(50), DS_SUBSTANCIA VARCHAR(50), PRIMARY KEY (DS_CAS, DS_SUBSTANCIA))");
  connection.query("CREATE TABLE IF NOT EXISTS medicamentos (ID INT AUTO_INCREMENT PRIMARY KEY, NU_REGISTRO VARCHAR(30), CO_GGREM BIGINT, CO_EAN VARCHAR(20), " +
                    "NO_PRODUTO VARCHAR(30), TP_PRODUTO INT, TP_LCCT VARCHAR(3), ST_REST_HOSP CHAR, ST_CAP CHAR, ST_CONFAZ87 CHAR, NU_PF0_INTEIRO INT, NU_PF18_INTEIRO INT)");

  connection.end();
}

// Empresas

function writeEmpresas() {

  //const connection = mysql.createConnection(databaseConnectionSettings);

  //connection.connect();

  fs.createReadStream(file)
    .pipe(csv(csvConfig))
    .on('data', function (data) {
      const cnpj = data.NU_CNPJ;
      const razao = data.NO_RAZAO_SOCIAL

      const sqlFormat = "INSERT INTO empresas (NU_CNPJ, NO_RAZAO_SOCIAL) VALUES (?, ?)";
      const values = [cnpj, razao];

      const sql = mysql.format(sqlFormat, values);

      console.log("Running:", sql);
      return;

      connection.query(sql, (error, results, fields) => {
        if (error) {
          if (error.errno == 1062) {
            console.log("Duplicate Private Key");
          } else {
            console.log("ERROR");
          }
        } else {
          console.log("Done with:", cnpj);
        }
      });
    })
    .on('end', function () {
      //connection.end();
    });
}

function writeSubstancias() {

  const connection = mysql.createConnection(databaseConnectionSettings);

  connection.connect();

  fs.createReadStream(file)
    .pipe(csv(csvConfig))
    .on('data', function (data) {
      const CAS_LIST = data.DS_CAS.split(';');
      const SUBSTANCIA_LIST = data.DS_SUBSTANCIA.split(';');

      CAS_LIST.forEach((cas, index) => {
        const substancia = SUBSTANCIA_LIST[index];
        const sqlFormat = "INSERT INTO substancias (DS_CAS, DS_SUBSTANCIA) VALUES (?, ?)";
        const values = [cas, substancia];

        const sql = mysql.format(sqlFormat, values);

        connection.query(sql, (error, results, fields) => {
          if (error) {
            if (error.errno == 1062) {
              console.log("Duplicate Private Key");
            } else {
              console.log("ERROR");
            }
          } else {
            console.log("Done with:", cas);
          }
        });
      });
    })
    .on('end', function () {
      connection.end();
    });
}

function writeMedicamento() {

  const connection = mysql.createConnection(databaseConnectionSettings);

  connection.connect();

  const mistakes = [];
  fs.createReadStream(file)
    .pipe(csv(csvConfig))
    .on('data', function (data) {

      const nu_registro = data.NU_REGISTRO;
      const co_ggrem = data.CO_GGREM || null;
      const co_ean = data.CO_EAN;
      const no_produto = data.NO_PRODUTO;
      const tp_produto = data.TP_PRODUTO || null;
      const tp_lcct = data.TP_LCCT;
      const st_rest_hosp = data.ST_REST_HOSP;
      const st_cap = data.ST_CAP;
      const st_confaz87 = data.ST_CONFAZ87;
      const nu_pf0_inteiro = data.NU_PF0_INTEIRO || null;
      const nu_pf18_inteiro = data.NU_PF18_INTEIRO || null;

      const sqlFormat = "INSERT INTO medicamentos (NU_REGISTRO, CO_GGREM, CO_EAN, NO_PRODUTO, TP_PRODUTO, TP_LCCT, ST_REST_HOSP, ST_CAP, ST_CONFAZ87, NU_PF0_INTEIRO, NU_PF18_INTEIRO) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

      const values = [nu_registro, co_ggrem, co_ean, no_produto, tp_produto, tp_lcct, st_rest_hosp, st_cap, st_confaz87, nu_pf0_inteiro, nu_pf18_inteiro];

      const sql = mysql.format(sqlFormat, values);

      connection.query(sql, (error, results, fields) => {
        if (error) {
            if (error.errno == 1062) {
              console.log("Duplicate Private Key");
            } else {
              console.log("ERROR");
              mistakes.push(error);
            }
        } else {
          console.log("Done with:", nu_registro);
        }
      });
    })
    .on('end', function () {
      connection.end();
      console.log(mistakes.join('\n'));
    });
}

//setupDatabase();
writeEmpresas();
//writeSubstancias();
//writeMedicamento();
