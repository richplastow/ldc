03 Item Constructor
===================


    tudor.add [
      "03 Item Constructor"
      tudor.is




      "The class and instance are expected types"


      "The Item class is a function"
      _o.F
      -> Item

      "`new` returns an object"
      _o.O
      -> new Item({ uid:'abc', index:0 })




      "Instance properties as expected"


      "`Item::uid` is a string"
      _o.S
      -> ( new Item({ uid:'abc', index:0 }) ).uid


      "`Item::index` is a number"
      _o.N
      -> ( new Item({ uid:'abc', index:0 }) ).index

      tudor.equal

      "`Item::uid` is as passed-in"
      'abc'
      -> ( new Item({ uid:'abc', index:0 }) ).uid

      "`Item::index` is as passed-in"
      55
      -> ( new Item({ uid:'abc', index:55 }) ).index




      "`config.uid` exceptions"
      tudor.throw


      "No `config.uid`"
      """
      /ldc/src/Item.litcoffee Item()
        config.uid is undefined and has no fallback"""
      -> new Item { index:0 }


      "Is boolean"
      """
      /ldc/src/Item.litcoffee Item()
        config.uid is type boolean not string"""
      -> new Item { uid:true, index:0 }


      "Empty string"
      """
      /ldc/src/Item.litcoffee Item()
        config.uid fails ^[a-z]\\w{1,23}$"""
      -> new Item { uid:'', index:0 }


      "Too short"
      """
      /ldc/src/Item.litcoffee Item()
        config.uid fails ^[a-z]\\w{1,23}$"""
      -> new Item { uid:'a', index:0 }


      "Too long"
      """
      /ldc/src/Item.litcoffee Item()
        config.uid fails ^[a-z]\\w{1,23}$"""
      -> new Item { uid:'aBcDeFgHiJkLmNoPqRsT123_X', index:0 }


      "Underscore is an invalid first character"
      """
      /ldc/src/Item.litcoffee Item()
        config.uid fails ^[a-z]\\w{1,23}$"""
      -> new Item { uid:'_abc', index:0 }


      "Number is an invalid first character"
      """
      /ldc/src/Item.litcoffee Item()
        config.uid fails ^[a-z]\\w{1,23}$"""
      -> new Item { uid:'1abc', index:0 }


      "Uppercase is an invalid first character"
      """
      /ldc/src/Item.litcoffee Item()
        config.uid fails ^[a-z]\\w{1,23}$"""
      -> new Item { uid:'Abc', index:0 }


      "Must not contain a hyphen"
      """
      /ldc/src/Item.litcoffee Item()
        config.uid fails ^[a-z]\\w{1,23}$"""
      -> new Item { uid:'ab-c', index:0 }




      "`config.index` exceptions"


      "No `config.index`"
      """
      /ldc/src/Item.litcoffee Item()
        config.index is undefined and has no fallback"""
      -> new Item { uid:'abc' }


      "Is string"
      """
      /ldc/src/Item.litcoffee Item()
        config.index is type string not integer"""
      -> new Item { uid:'abc', index:'3' }


      "Is not a whole number"
      """
      /ldc/src/Item.litcoffee Item()
        config.index is a number but not an integer"""
      -> new Item { uid:'abc', index:3.5 }


      "Is negative"
      """
      /ldc/src/Item.litcoffee Item()
        config.index is -1 (must be 0-9999)"""
      -> new Item { uid:'abc', index:-1 }


      "Is too high"
      """
      /ldc/src/Item.litcoffee Item()
        config.index is 9999999 (must be 0-9999)"""
      -> new Item { uid:'abc', index:9999999 }


    ];
