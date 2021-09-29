import sql from 'mssql'
import { sqlConfig } from './sql/config.js'


sql.on('error', err => {
    console.log(err)
})

sql.connect(sqlConfig).then(pool => {
    return pool.request()
    .input('nome', sql.VarChar(30), 'Sabonete Protex')
    .input('quantidade', sql.VarChar(20), '400ml')
    .input('marca', sql.VarChar(30), 'EMS')
    .input('fabricante', sql.VarChar(30), 'Colgate-Palmolive')
    .input('descricao', sql.VarChar(500), 'Sabonete')
    .input('preco', sql.Numeric, 16.94)
    .execute('SP_I_FAR_FARMACIA')
}).then(result => {
    console.log(result);
}).catch(err => {
    console.log(err.message);
})