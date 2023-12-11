const sql = require('mssql')
const sqlConfig = {
    user: 'sa',
    password: 'DestinyForsaken2018',
    database: 'joincert2023',
    server: 'PC-2023-003',
    options: {
        trustServerCertificate: true
    }
}

async function testDB() {
    try {
        // make sure that any items are correctly URL encoded in the connection string
        await sql.connect(sqlConfig)
        const result = await sql.query`select * from dbo.Activity where ID = 1`
        console.log(result)
    } catch (err) {
        // ... error checks
        console.log(err)
    }
}

export default function Page() {
    testDB()
    return <p>TestPage</p>;
}