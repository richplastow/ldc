04 Ldc::deleteItem()
====================


    tudor.add [
      "04 Ldc::deleteItem()"
      tudor.is




      "`deleteItem()` is a function which returns `undefined`"

Prepare a test-instance. 

      -> [new Ldc]

      "`deleteItem()` is a function"
      _o.F
      (ldc) -> ldc.deleteItem

      "deleting an Item returns `undefined`"
      _o.U
      (ldc) -> ldc.addItem('Hat',{},'test'); ldc.deleteItem('test')




      "The `id` argument accepts a string as expected"
      tudor.equal


      "Shortest possible id"
      0
      (ldc) ->
        ldc.addItem 'Hat', {}, 'aB'
        ldc.deleteItem 'aB'
        ldc.items._length


      "Longest possible id"
      undefined
      (ldc) ->
        ldc.addItem 'Hat', {}, 'abcdefghijklmnopqrst123_'
        ldc.deleteItem 'abcdefghijklmnopqrst123_'
        ldc.items.abcdefghijklmnopqrst123_




      "`id` exceptions"
      tudor.throw


      "Is an array"
      """
      /ldc/src/Ldc.litcoffee Ldc::deleteItem()
        argument id is type array not string"""
      (ldc) ->
        ldc.addItem 'Hat', {}, 'abc123'
        ldc.deleteItem ['abc123']


      "Empty string"
      """
      /ldc/src/Ldc.litcoffee Ldc::deleteItem()
        argument id fails ^[a-z]\\w{1,23}$"""
      (ldc) -> ldc.deleteItem ''


      "Too short"
      """
      /ldc/src/Ldc.litcoffee Ldc::deleteItem()
        argument id fails ^[a-z]\\w{1,23}$"""
      (ldc) -> ldc.deleteItem 'a'


      "Too long"
      """
      /ldc/src/Ldc.litcoffee Ldc::deleteItem()
        argument id fails ^[a-z]\\w{1,23}$"""
      (ldc) -> ldc.deleteItem 'aBcDeFgHiJkLmNoPqRsT123_X'


      "Underscore is an invalid first character"
      """
      /ldc/src/Ldc.litcoffee Ldc::deleteItem()
        argument id fails ^[a-z]\\w{1,23}$"""
      (ldc) -> ldc.deleteItem '_abc'


      "Number is an invalid first character"
      """
      /ldc/src/Ldc.litcoffee Ldc::deleteItem()
        argument id fails ^[a-z]\\w{1,23}$"""
      (ldc) -> ldc.deleteItem '1abc'


      "Uppercase is an invalid first character"
      """
      /ldc/src/Ldc.litcoffee Ldc::deleteItem()
        argument id fails ^[a-z]\\w{1,23}$"""
      (ldc) -> ldc.deleteItem 'Abc'


      "Must not contain a hyphen"
      """
      /ldc/src/Ldc.litcoffee Ldc::deleteItem()
        argument id fails ^[a-z]\\w{1,23}$"""
      (ldc) -> ldc.deleteItem 'ab-c'


      "Must exist in `items`"
      """
      /ldc/src/Ldc.litcoffee Ldc::deleteItem()
        the Item with id 'nope' does not exist"""
      (ldc) -> ldc.deleteItem 'nope'




      "`_length`, `_first`, `_last`, `prev` and `next` as expected"
      tudor.equal


      "After deleting 'abc123', `items._length` is 0..."
      0
      (ldc) -> ldc.deleteItem 'abc123'; ldc.items._length

      "...`items._first` is null..."
      null
      (ldc) -> ldc.items._first

      "...`items._last` is null..."
      null
      (ldc) -> ldc.items._last

      "...and `items` stringifies as expected"
      '{"_length":0,"_first":null,"_last":null}'
      (ldc) -> JSON.stringify ldc.items

      "After adding three Items and deleting the middle, `items._length` is 2"
      2
      (ldc) ->
        ldc.addItem 'Hat' , {}, 'the_first'
        ldc.addItem 'Hat' , {}, 'the_second'
        ldc.addItem 'Sine', {}, 'the_third'
        ldc.deleteItem 'the_second'
        ldc.items._length

      "...`items._first` is 'the_first'..."
      'the_first'
      (ldc) -> ldc.items._first.id

      "...`items._last` is 'the_third'..."
      'the_third'
      (ldc) -> ldc.items._last.id

      "...the first Item’s `next` is 'the_third'..."
      'the_third'
      (ldc) -> ldc.items._first.next.id

      "...and the last Item’s `prev` is 'the_first'"
      'the_first'
      (ldc) -> ldc.items._last.prev.id

      "After deleting the first Item, the last Item’s `prev` is null..."
      null
      (ldc) -> ldc.deleteItem 'the_first'; ldc.items._last.prev

      "...and `items._first` is 'the_third'"
      'the_third'
      (ldc) -> ldc.items._first.id



    ];


