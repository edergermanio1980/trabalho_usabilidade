var sqlite3 = require('sqlite3').verbose()

const DBSOURCE = "db.sqlite"

let db = new sqlite3.Database(DBSOURCE, (err) => {
    if (err) {
      // Cannot open database
      console.error(err.message)
      throw err
    }else{
        console.log('Conectado ao Banco de dados.')
        db.run(`CREATE TABLE usuario (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            nome text, 
            email text, 
            senha text
            )`,
        (err) => {
            if (err) {
                // Table already created
            }else{
                // Table just created, creating some rows
                
            }
        });  
    }
});


module.exports = db
