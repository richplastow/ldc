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


      "`Ldc::items` is an object"
      _o.O
      -> (new Ldc).items

      tudor.equal

      "`Ldc::items` is empty"
      0
      -> (new Ldc).items._length

      "`Ldc::items` has no `_first` Item"
      null
      -> (new Ldc).items._first

      "`Ldc::items` has no `_last` Item"
      null
      -> (new Ldc).items._last


    ];
