const path = require('path')
const config = require('../src/config')
const { env } = require('process')


console.log("--- Styles only ---")
module.exports = [config.styles]