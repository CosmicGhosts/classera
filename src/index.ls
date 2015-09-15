merge = require 'object-assign'

descriptor =
  configurable: true
  enumerable: true
  writable: true

propsWithDescs = (props, descriptor) ->
  propWithDesc = (prop) ->
    desc = merge value: props[prop], descriptor
    "#{prop}": desc

  Object.keys props
    .map propWithDesc
    .reduce merge, {}

classera = (ctor) ->
  create: (props) ->
    props = propsWithDescs props, descriptor
    Object.create ctor.prototype, props

module.exports = classera
