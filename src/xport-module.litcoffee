Export Module
=============

#### The module’s only entry-point is the `Ldc` class

First, try defining an AMD module, eg for [RequireJS](http://requirejs.org/). 

    if _o.F == typeof define and define.amd
      define -> Ldc

Next, try exporting for CommonJS, eg for [Node.js](http://goo.gl/Lf84YI):  
`var Ldc = require('ldc');`

    else if _o.O == typeof module and module and module.exports
      module.exports = Ldc

Otherwise, add the `Ldc` class to global scope.  
Browser usage: `var ldc = new window.Ldc();`

    else _o.G.Ldc = Ldc


    ;

