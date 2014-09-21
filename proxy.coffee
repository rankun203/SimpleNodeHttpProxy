#!/usr/bin/env coffee

http = require 'http'
request = require 'request'
url = require 'url'

http.createServer (req, res) ->
  qurl = req.url
  purl = qurl.substr(1, qurl.length)
  return if !purl
  
  console.log "proxy for #{purl}"
  request {uri: purl}, (err, response, body) ->
    res.write body.replace(/http\:\/\//g, 'http://rankun.org:8888/http://')
      .replace(/\"[h]?[t]?[t]?[p]?[s]?[:]?\/\//g, '\"http://rankun.org:8888/https://')
    res.end()
.listen '8888'
