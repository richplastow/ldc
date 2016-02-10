Item
====

@todo describe


#### Base class for all classes which can be added to `Ldc::items`

    class Item
      C: 'Item'
      toString: -> '[object Item]'

      constructor: (config={}) ->
        M = "/ldc/src/Item.litcoffee
          Item()\n  "


Make `v()`, a function for checking that `config` properties are ok. 

        v = _o.validator M + 'config.', config




Properties
----------


#### `uid <string>`
@todo describe

        @uid = v 'uid <string ^[a-z]\\w{1,23}$>'


#### `index <integer>`
@todo describe

        @index = v 'index <integer 0-9999>'




Methods
-------


#### `xx()`
- `yy <zz>`      @todo describe
- `<undefined>`  does not return anything

@todo describe

      xx: (yy) ->
        M = "/ldc/src/Item.litcoffee
          Item::xx()\n  "



    ;
