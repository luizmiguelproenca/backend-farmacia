// API REST de Produtos da Farmácia
import express from 'express'
import sql from 'mssql'
import { sqlConfig } from '../sql/config.js'
const router = express.Router()

/*
 * GET /produtos
 * Retornar a lista de todos os veículos
 */
router.get('/', (req, res) => {
    try{
        sql.connect(sqlConfig).then(pool => {
            return pool.request()
            .execute('SP_S_FAR_FARMACIA')
        }).then(dados => {
            res.status(200).json(dados.recordset)
        }).catch( err => {
            res.status(400).json(err) //400 - Bad Request
        })
    } catch (err){
        console.error(err);
    }
})


/*
 * GET /produtos/:nome
 * Retorna um produto através do nome
 */

router.get('/:nome', (req, res) => {
    const nome = req.params.nome
    try{
        sql.connect(sqlConfig).then(pool => {
            return pool.request()
            .input('nome', sql.VarChar(30), nome)
            .execute('SP_S_FAR_FARMACIA_NOME')
        }).then(dados => {
            res.status(200).json(dados.recordset)
        }).catch( err => {
            res.status(400).json(err) //400 - Bad Request
        })
    } catch (err){
        console.error(err);
    }
})


/*
 * POST /produtos
 * Insere um novo produto
 */
router.post('/', (req, res) => {
    sql.connect(sqlConfig).then(pool => {
        const {nome, quantidade, marca, fabricante, descricao, preco} = req.body
        return pool.request()
        .input('nome', sql.VarChar(30), nome)
        .input('quantidade', sql.VarChar(20), quantidade)
        .input('marca', sql.VarChar(30), marca)
        .input('fabricante', sql.VarChar(30), fabricante)
        .input('descricao', sql.VarChar(500), descricao)
        .input('preco', sql.Numeric(5,2), preco)
        .execute('SP_I_FAR_FARMACIA')
    }).then(dados => {
        res.status(200).json(dados.output)
    }).catch(err => {
        res.status(400).json(err.message) // Bad Request
    }) 
})

/*
 * PUT /produtos
 * Altera os dados um produto
 */
router.put('/', (req, res) => {
    sql.connect(sqlConfig).then(pool => {
        const {nome, quantidade, marca, fabricante, descricao, preco} = req.body
        return pool.request()
        .input('nome', sql.VarChar(30), nome)
        .input('quantidade', sql.VarChar(20), quantidade)
        .input('marca', sql.VarChar(30), marca)
        .input('fabricante', sql.VarChar(30), fabricante)
        .input('descricao', sql.VarChar(500), descricao)
        .input('preco', sql.Numeric(5,2), preco)
        .execute('SP_U_FAR_FARMACIA')
    }).then(dados => {
        res.status(200).json('Produto alterado com sucesso!')
    }).catch(err => {
        res.status(400).json(err.message) // Bad Request
    }) 
})


/*
 * DELETE /produtos/:nome
 * Apaga um produto pelo nome
 */

router.delete('/:nome', (req, res) => {
    sql.connect(sqlConfig).then(pool => {
        const nome = req.params.nome
        return pool.request()
        .input('nome', sql.VarChar(30), nome)
        .execute('SP_D_FAR_FARMACIA')
    }).then(dados => {
        res.status(200).json('Produto excluído com sucesso!')
    }).catch(err => {
        res.status(400).json(err.message)
    })
})

export default router