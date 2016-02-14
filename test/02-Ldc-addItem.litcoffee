02 Ldc::addItem()
=================


    tudor.add [
      "02 Ldc::addItem()"
      tudor.is




      "`addItem()` is a function which returns a string"

Prepare a test-instance. 

      -> [new Ldc]

      "`addItem()` is a function"
      _o.F
      (ldc) -> ldc.addItem

      "`addItem('Hat')` returns a string"
      _o.S
      (ldc) -> ldc.addItem('Hat')




      "The `kind` argument accepts class-names as expected"
      tudor.equal


      "'Hat' is a recognized class-name"
      'Item.Hit.Hat'
      (ldc) -> ldc.addItem('Hat'); ldc.items[ldc.items.length-1].C


      "'Sine' is a recognized class-name"
      'Item.Tone.Sine'
      (ldc) -> ldc.addItem('Sine'); ldc.items[ldc.items.length-1].C

@todo more class-names




      "`kind` exceptions"
      tudor.throw


      "`kind` not provided"
      """
      /ldc/src/Ldc.litcoffee Ldc::addItem()
        argument kind is undefined and has no fallback"""
      (ldc) -> ldc.addItem()


      "An array, not a string"
      """
      /ldc/src/Ldc.litcoffee Ldc::addItem()
        argument kind is type array not string"""
      (ldc) -> ldc.addItem ['H','a','t']


      "'Tone' is not a recognized class-name"
      """
      /ldc/src/Ldc.litcoffee Ldc::addItem()
        argument kind fails ^Hat$|^Sine$"""
      (ldc) -> ldc.addItem 'Tone'




      "The `config` argument accepts an object as expected"
      tudor.equal


      "An empty object"
      4
      (ldc) -> ldc.addItem('Hat', {}); ldc.items.length


      "An object with arbitrary content"
      5
      (ldc) -> ldc.addItem('Hat', { a:1, b:2 }); ldc.items.length


      "Can be undefined"
      6
      (ldc) -> ldc.addItem('Hat', undefined); ldc.items.length




      "`config` exceptions"
      tudor.throw


      "A `Date` object"
      """
      /ldc/src/Ldc.litcoffee Ldc::addItem()
        argument config is type date not object"""
      (ldc) -> ldc.addItem 'Hat', new Date()


      "Is the `null` object"
      """
      /ldc/src/Ldc.litcoffee Ldc::addItem()
        argument config is type null not object"""
      (ldc) -> ldc.addItem 'Hat', null




      "The `uid` argument accepts a string as expected"
      tudor.equal


      "Shortest possible uid"
      7
      (ldc) ->
        ldc.addItem 'Hat', undefined, 'aB'
        ldc.items.length


      "Longest possible uid"
      'abcdefghijklmnopqrst123_'
      (ldc) ->
        ldc.addItem 'Hat', {}, 'abcdefghijklmnopqrst123_'


      "Can repeat existing uid, if case is different"
      9
      (ldc) ->
        ldc.addItem 'Hat', {}, 'aBcDeFgHiJkLmNoPqRsT123_'
        ldc.items.length




      "`uid` exceptions"
      tudor.throw


      "Is boolean"
      """
      /ldc/src/Ldc.litcoffee Ldc::addItem()
        argument uid is type boolean not string"""
      (ldc) -> ldc.addItem 'Hat', {}, true


      "Empty string"
      """
      /ldc/src/Ldc.litcoffee Ldc::addItem()
        argument uid fails ^[a-z]\\w{1,23}$"""
      (ldc) -> ldc.addItem 'Hat', {}, ''


      "Too short"
      """
      /ldc/src/Ldc.litcoffee Ldc::addItem()
        argument uid fails ^[a-z]\\w{1,23}$"""
      (ldc) -> ldc.addItem 'Hat', {}, 'a'


      "Too long"
      """
      /ldc/src/Ldc.litcoffee Ldc::addItem()
        argument uid fails ^[a-z]\\w{1,23}$"""
      (ldc) -> ldc.addItem 'Hat', {}, 'aBcDeFgHiJkLmNoPqRsT123_X'


      "Underscore is an invalid first character"
      """
      /ldc/src/Ldc.litcoffee Ldc::addItem()
        argument uid fails ^[a-z]\\w{1,23}$"""
      (ldc) -> ldc.addItem 'Hat', {}, '_abc'


      "Number is an invalid first character"
      """
      /ldc/src/Ldc.litcoffee Ldc::addItem()
        argument uid fails ^[a-z]\\w{1,23}$"""
      (ldc) -> ldc.addItem 'Hat', {}, '1abc'


      "Uppercase is an invalid first character"
      """
      /ldc/src/Ldc.litcoffee Ldc::addItem()
        argument uid fails ^[a-z]\\w{1,23}$"""
      (ldc) -> ldc.addItem 'Hat', {}, 'Abc'


      "Must not contain a hyphen"
      """
      /ldc/src/Ldc.litcoffee Ldc::addItem()
        argument uid fails ^[a-z]\\w{1,23}$"""
      (ldc) -> ldc.addItem 'Hat', {}, 'ab-c'




    ];


