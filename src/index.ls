soc = require 'soc'

classera = (ctor) ->
  create: ->
    Object.create ctor.prototype, {
      name:
        value: 'tim'
        configurable: true
        enumerable: true
        writable: true
    }

# function clarissa(constructor)
#   create: (properties, descriptor) ->
#     descriptor ?= configurable: true, enumerable: true, writable: true
#     properties = propertiesWithDescriptors(properties, descriptor)
#     return Object.create(constructor.prototype, properties)
#
# function propertiesWithDescriptors(properties, descriptor)
#   keys = Object.keys(properties)
#   obj = soc()
#
#   propertiesWithDescriptors = keys.map (key) ->
#     property = {}
#     descriptor = soc({value: properties[key]}).extend(overrides).done!
#     property[key] = descriptor
#     property
#
#   properties = propertiesWithDescriptors.reduce((previousObj, currentObj) ->
#     previousObj.extend(currentObj)
#   , obj).done!

module.exports = classera
