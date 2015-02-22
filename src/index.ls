soc = require 'soc'

classera = (ctor) ->
  create: (properties) ->
    descriptor = configurable: true, enumerable: true, writable: true
    properties = propertiesWithDescriptors(properties, descriptor)
    Object.create(ctor.prototype, properties)

function propertiesWithDescriptors(properties, descriptor)
  obj = soc()
  propsWDesc = Object.keys(properties).map propertyWithDescriptor(descriptor, properties)
  properties = propsWDesc.reduce((previousObj, currentObj) ->
    previousObj.extend currentObj
  , obj).done!

function propertyWithDescriptor(descriptor, properties)
  (property) ->
    p = {}
    p[property] = soc(value: properties[property])
      .extend(descriptor)
      .done!
    p

module.exports = classera
