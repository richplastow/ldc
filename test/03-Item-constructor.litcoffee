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
      -> new Item({ uid:'abc', prev:null, next:null })




      "Instance properties as expected"

Prepare test-instances. 

      ->
        [
          new Item(     { uid:'test_item', prev:null, next:null })
          new Item.Tone({ uid:'test_tone', prev:null, next:null })
        ]


      "`Item::uid` is a string"
      _o.S
      -> ( new Item({ uid:'abc', prev:null, next:null }) ).uid

      "`Item::prev` can be null"
      _o.X
      -> ( new Item({ uid:'abc', prev:null, next:null }) ).prev

      "`Item::prev` can be another Item"
      _o.O
      (item, tone) -> ( new Item({ uid:'abc', prev:item, next:null }) ).prev

      "`Item::next` can be null"
      _o.X
      -> ( new Item({ uid:'abc', prev:null, next:null }) ).next

      "`Item::next` can be another Item"
      _o.O
      (item, tone) -> ( new Item({ uid:'abc', prev:null, next:tone }) ).next

      tudor.equal

      "`Item::uid` is as passed-in"
      'abc'
      -> ( new Item({ uid:'abc', prev:null, next:null }) ).uid

      "`Item::prev` is as passed-in"
      'test_item'
      (item, tone) -> ( new Item({ uid:'abc', prev:item, next:null }) ).prev.uid

      "`Item::next` is as passed-in"
      'test_tone'
      (item, tone) -> ( new Item({ uid:'abc', prev:null, next:tone }) ).next.uid




      "`config.uid` exceptions"
      tudor.throw


      "No `config.uid`"
      """
      /ldc/src/Item.litcoffee Item()
        config.uid is undefined and has no fallback"""
      -> new Item { prev:null, next:null }


      "Is boolean"
      """
      /ldc/src/Item.litcoffee Item()
        config.uid is type boolean not string"""
      -> new Item { uid:true, prev:null, next:null }


      "Empty string"
      """
      /ldc/src/Item.litcoffee Item()
        config.uid fails ^[a-z]\\w{1,23}$"""
      -> new Item { uid:'', prev:null, next:null }


      "Too short"
      """
      /ldc/src/Item.litcoffee Item()
        config.uid fails ^[a-z]\\w{1,23}$"""
      -> new Item { uid:'a', prev:null, next:null }


      "Too long"
      """
      /ldc/src/Item.litcoffee Item()
        config.uid fails ^[a-z]\\w{1,23}$"""
      -> new Item { uid:'aBcDeFgHiJkLmNoPqRsT123_X', prev:null, next:null }


      "Underscore is an invalid first character"
      """
      /ldc/src/Item.litcoffee Item()
        config.uid fails ^[a-z]\\w{1,23}$"""
      -> new Item { uid:'_abc', prev:null, next:null }


      "Number is an invalid first character"
      """
      /ldc/src/Item.litcoffee Item()
        config.uid fails ^[a-z]\\w{1,23}$"""
      -> new Item { uid:'1abc', prev:null, next:null }


      "Uppercase is an invalid first character"
      """
      /ldc/src/Item.litcoffee Item()
        config.uid fails ^[a-z]\\w{1,23}$"""
      -> new Item { uid:'Abc', prev:null, next:null }


      "Must not contain a hyphen"
      """
      /ldc/src/Item.litcoffee Item()
        config.uid fails ^[a-z]\\w{1,23}$"""
      -> new Item { uid:'ab-c', prev:null, next:null }




      "`config.prev` exceptions"


      "No `config.prev`"
      """
      /ldc/src/Item.litcoffee Item()
        config.prev is undefined and has no fallback"""
      -> new Item { uid:'abc' }


      "Is string"
      """
      /ldc/src/Item.litcoffee Item()
        config.prev is type string not Item|null"""
      -> new Item { uid:'abc', prev:'3' }


      "Is a number"
      """
      /ldc/src/Item.litcoffee Item()
        config.prev is type number not Item|null"""
      -> new Item { uid:'abc', prev:3.5 }


      "Is a generic object"
      """
      /ldc/src/Item.litcoffee Item()
        config.prev is type object not Item|null"""
      -> new Item { uid:'abc', prev:{} }


      "Does not inherit from Item"
      """
      /ldc/src/Item.litcoffee Item()
        config.prev is type object not Item|null"""
      -> new Item { uid:'abc', prev:(new Ldc) }


    ];
