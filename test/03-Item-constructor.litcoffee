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
      -> new Item({ id:'abc', prev:null, next:null })




      "Instance properties as expected"

Prepare test-instances. 

      ->
        [
          new Item(     { id:'test_item', prev:null, next:null })
          new Item.Tone({ id:'test_tone', prev:null, next:null })
        ]


      "`Item::id` is a string"
      _o.S
      -> ( new Item({ id:'abc', prev:null, next:null }) ).id

      "`Item::prev` can be null"
      _o.X
      -> ( new Item({ id:'abc', prev:null, next:null }) ).prev

      "`Item::prev` can be another Item"
      _o.O
      (item, tone) -> ( new Item({ id:'abc', prev:item, next:null }) ).prev

      "`Item::next` can be null"
      _o.X
      -> ( new Item({ id:'abc', prev:null, next:null }) ).next

      "`Item::next` can be another Item"
      _o.O
      (item, tone) -> ( new Item({ id:'abc', prev:null, next:tone }) ).next

      tudor.equal

      "`Item::id` is as passed-in"
      'abc'
      -> ( new Item({ id:'abc', prev:null, next:null }) ).id

      "`Item::prev` is as passed-in"
      'test_item'
      (item, tone) -> ( new Item({ id:'abc', prev:item, next:null }) ).prev.id

      "`Item::next` is as passed-in"
      'test_tone'
      (item, tone) -> ( new Item({ id:'abc', prev:null, next:tone }) ).next.id




      "`config.id` exceptions"
      tudor.throw


      "No `config.id`"
      """
      /ldc/src/Item.litcoffee Item()
        config.id is undefined and has no fallback"""
      -> new Item { prev:null, next:null }


      "Is boolean"
      """
      /ldc/src/Item.litcoffee Item()
        config.id is type boolean not string"""
      -> new Item { id:true, prev:null, next:null }


      "Empty string"
      """
      /ldc/src/Item.litcoffee Item()
        config.id fails ^[a-z]\\w{1,23}$"""
      -> new Item { id:'', prev:null, next:null }


      "Too short"
      """
      /ldc/src/Item.litcoffee Item()
        config.id fails ^[a-z]\\w{1,23}$"""
      -> new Item { id:'a', prev:null, next:null }


      "Too long"
      """
      /ldc/src/Item.litcoffee Item()
        config.id fails ^[a-z]\\w{1,23}$"""
      -> new Item { id:'aBcDeFgHiJkLmNoPqRsT123_X', prev:null, next:null }


      "Underscore is an invalid first character"
      """
      /ldc/src/Item.litcoffee Item()
        config.id fails ^[a-z]\\w{1,23}$"""
      -> new Item { id:'_abc', prev:null, next:null }


      "Number is an invalid first character"
      """
      /ldc/src/Item.litcoffee Item()
        config.id fails ^[a-z]\\w{1,23}$"""
      -> new Item { id:'1abc', prev:null, next:null }


      "Uppercase is an invalid first character"
      """
      /ldc/src/Item.litcoffee Item()
        config.id fails ^[a-z]\\w{1,23}$"""
      -> new Item { id:'Abc', prev:null, next:null }


      "Must not contain a hyphen"
      """
      /ldc/src/Item.litcoffee Item()
        config.id fails ^[a-z]\\w{1,23}$"""
      -> new Item { id:'ab-c', prev:null, next:null }




      "`config.prev` exceptions"


      "No `config.prev`"
      """
      /ldc/src/Item.litcoffee Item()
        config.prev is undefined and has no fallback"""
      -> new Item { id:'abc' }


      "Is string"
      """
      /ldc/src/Item.litcoffee Item()
        config.prev is type string not Item|null"""
      -> new Item { id:'abc', prev:'3' }


      "Is a number"
      """
      /ldc/src/Item.litcoffee Item()
        config.prev is type number not Item|null"""
      -> new Item { id:'abc', prev:3.5 }


      "Is a generic object"
      """
      /ldc/src/Item.litcoffee Item()
        config.prev is type object not Item|null"""
      -> new Item { id:'abc', prev:{} }


      "Does not inherit from Item"
      """
      /ldc/src/Item.litcoffee Item()
        config.prev is type object not Item|null"""
      -> new Item { id:'abc', prev:(new Ldc) }


    ];
