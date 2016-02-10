02 Ldc::add()
=============


    tudor.add [
      "02 Ldc::add()"
      tudor.is




      "`add()` is a function which returns a string"

Prepare a test-instance. 

      -> [new Ldc]

      "`add()` is a function"
      _o.F
      (ldc) -> ldc.add

      "`add('Hat')` returns a string"
      _o.S
      (ldc) -> ldc.add('Hat')




      "The `kind` argument accepts class-names as expected"
      tudor.equal


      "'Hat' is a recognized class-name"
      'Item.Hit.Hat'
      (ldc) -> ldc.add('Hat'); ldc.items[ldc.items.length-1].C


      "'Sine' is a recognized class-name"
      'Item.Tone.Sine'
      (ldc) -> ldc.add('Sine'); ldc.items[ldc.items.length-1].C

@todo more class-names




      "`kind` exceptions"
      tudor.throw


      "`kind` not provided"
      """
      /ldc/src/Ldc.litcoffee Ldc::add()
        argument kind is undefined and has no fallback"""
      (ldc) -> ldc.add()


      "An array, not a string"
      """
      /ldc/src/Ldc.litcoffee Ldc::add()
        argument kind is type array not string"""
      (ldc) -> ldc.add ['H','a','t']


      "'Tone' is not a recognized class-name"
      """
      /ldc/src/Ldc.litcoffee Ldc::add()
        argument kind fails ^Hat$|^Sine$"""
      (ldc) -> ldc.add 'Tone'




      "The `config` argument accepts an object as expected"
      tudor.equal


      "An empty object"
      4
      (ldc) -> ldc.add('Hat', {}); ldc.items.length


      "An object with arbitrary content"
      5
      (ldc) -> ldc.add('Hat', { a:1, b:2 }); ldc.items.length


      "Can be undefined"
      6
      (ldc) -> ldc.add('Hat', undefined); ldc.items.length




      "`config` exceptions"
      tudor.throw


      "A `Date` object"
      """
      /ldc/src/Ldc.litcoffee Ldc::add()
        argument config is type date not object"""
      (ldc) -> ldc.add 'Hat', new Date()


      "Is the `null` object"
      """
      /ldc/src/Ldc.litcoffee Ldc::add()
        argument config is type null not object"""
      (ldc) -> ldc.add 'Hat', null




      "The `uid` argument accepts a string as expected"
      tudor.equal


      "Shortest possible uid"
      7
      (ldc) -> ldc.add('Hat', undefined, 'aB'); ldc.items.length


      "Longest possible uid"
      'abcdefghijklmnopqrst123_'
      (ldc) -> ldc.add('Hat', {}, 'abcdefghijklmnopqrst123_')


      "Can repeat existing uid, if case is different"
      9
      (ldc) -> ldc.add('Hat', {}, 'aBcDeFgHiJkLmNoPqRsT123_'); ldc.items.length




      "`uid` exceptions"
      tudor.throw


      "Empty string"
      """
      /ldc/src/Ldc.litcoffee Ldc::add()
        argument uid fails ^[a-z]\\w{1,23}$"""
      (ldc) -> ldc.add 'Hat', {}, ''


      "Too short"
      """
      /ldc/src/Ldc.litcoffee Ldc::add()
        argument uid fails ^[a-z]\\w{1,23}$"""
      (ldc) -> ldc.add 'Hat', {}, 'a'


      "Too long"
      """
      /ldc/src/Ldc.litcoffee Ldc::add()
        argument uid fails ^[a-z]\\w{1,23}$"""
      (ldc) -> ldc.add 'Hat', {}, 'aBcDeFgHiJkLmNoPqRsT123_X'


      "Underscore is an invalid first character"
      """
      /ldc/src/Ldc.litcoffee Ldc::add()
        argument uid fails ^[a-z]\\w{1,23}$"""
      (ldc) -> ldc.add 'Hat', {}, '_abc'


      "Number is an invalid first character"
      """
      /ldc/src/Ldc.litcoffee Ldc::add()
        argument uid fails ^[a-z]\\w{1,23}$"""
      (ldc) -> ldc.add 'Hat', {}, '1abc'


      "Uppercase is an invalid first character"
      """
      /ldc/src/Ldc.litcoffee Ldc::add()
        argument uid fails ^[a-z]\\w{1,23}$"""
      (ldc) -> ldc.add 'Hat', {}, 'Abc'


      "Must not contain a hyphen"
      """
      /ldc/src/Ldc.litcoffee Ldc::add()
        argument uid fails ^[a-z]\\w{1,23}$"""
      (ldc) -> ldc.add 'Hat', {}, 'ab-c'




    ];


