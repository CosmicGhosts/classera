# Module
classera = require '../lib'

# Dependencies
sinon = require 'sinon'
sinonChai = require 'sinon-chai'
chai = require 'chai'
{expect} = chai
chai.use(sinonChai)
{_extend} = require 'util'

o = it
x = it.skip

describe 'classera', ->

  context 'when given an constructor', ->

    Person = (opts) ->
      @name = opts.name

    Person.prototype = {}

    beforeEach ->
      @constructor = Person

    o 'Should wrap the constructor with an create method', ->
      Person = classera(@constructor)
      expect(-> Person.create(name: 'tim') ).not.to.throw!

    o 'Should proxy the options passed into create to the constructor', ->
      Person = classera(@constructor)
      tim = Person.create(name: 'tim')
      expect(tim instanceof @constructor).to.equal true
      expect(tim.name).to.equal 'tim'

    o 'Should set the properties to be configurable by default', ->
      Person = classera(@constructor)
      tim = Person.create(name: 'tim', age: 21)
      nameDescriptor = Object.getOwnPropertyDescriptor(tim, 'name')
      expect(nameDescriptor.configurable).to.equal true

    o 'Should set the properties to be enumerable by default', ->
      Person = classera(@constructor)
      tim = Person.create(name: 'tim', age: 21)
      nameDescriptor = Object.getOwnPropertyDescriptor(tim, 'name')
      expect(nameDescriptor.enumerable).to.equal true

    o 'Should set the properties to be writable by default', ->
      Person = classera(@constructor)
      tim = Person.create(name: 'tim', age: 21)
      nameDescriptor = Object.getOwnPropertyDescriptor(tim, 'name')
      expect(nameDescriptor.writable).to.equal true
