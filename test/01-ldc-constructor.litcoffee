01 Ldc Constructor
==================


    tudor.add [
      "01 Ldc Constructor"
      tudor.is




      "The class and instance are expected types"


      "The Ldc class is a function"
      _o.F
      -> Ldc

      "`new` returns an object"
      _o.O
      -> new Ldc




      "Instance properties as expected"


      "`ldc.items` is an array"
      _o.A
      -> (new Ldc).items

      tudor.equal

      "`ldc.items` is empty"
      0
      -> (new Ldc).items.length


    ];
