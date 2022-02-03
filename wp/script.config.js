const path = require('path')
const config = require('../src/config')
const { env } = require('process')



console.log("--- Scripts only ---")
module.exports = [config.scripts]