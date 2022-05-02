const express = require('express')
const app = express()
const port = 3000

const config = {
    host: 'mysql-db',
    user: 'root',
    password: 'root',
    database: 'nodedb'
}

const mysql = require('mysql')

const sql = `INSERT INTO people(name) VALUES ('Leonardo Alessandro Estevam')`

app.get('/', (req, res) => {
    const connection = mysql.createConnection(config)
    connection.query(sql)
    connection.end()

    res.send('<h1>Full Cycle!</h1>')
})

app.listen(port, () => {
    console.log('Rodando na porta ' + port)
})
