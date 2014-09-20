#!/usr/bin/env coffee

http = require 'http'
url = require 'url'

http.createServer (req, res) ->
  rtn = 
    reqHeaders: req.headers
    reqUrl: req.url
    reqMethod: req.method
    params: url.parse(req.url, true)

  res.write JSON.stringify rtn
  res.end()
.listen '8888'
