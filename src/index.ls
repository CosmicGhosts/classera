soc = require 'soc'

merge = (x, y) ->
  soc(x)
    .merge(y)
    .unwrap!

descriptor =
  configurable: true
  enumerable: true
  writable: true

propsWithDescs = (props, descriptor) ->
  propWithDesc = (prop) ->
    "#{prop}": soc(value: props[prop])
      .merge descriptor
      .unwrap!

  Object.keys props
    .map propWithDesc
    .reduce merge, {}

classera = (ctor) ->
  create: (props) ->
    props = propsWithDescs props, descriptor
    Object.create ctor.prototype, props

module.exports = classera
