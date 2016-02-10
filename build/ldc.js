// Generated by CoffeeScript 1.9.2
(function(_oG) {
/*! Ldc 0.0.1 //// MIT Licence //// http://ldc.richplastow.com/ */
var Ldc, SomeClass, _o, _oT, _oV;

_oT = 'Ldc';

_oV = '0.0.1';

_o = {};

SomeClass = (function() {
  SomeClass.prototype.C = 'SomeClass';

  SomeClass.prototype.toString = function() {
    return '[object SomeClass]';
  };

  function SomeClass(config) {
    var M;
    if (config == null) {
      config = {};
    }
    M = "/ldc/src/SomeClass/SomeClass.litcoffee SomeClass()\n  ";
    this.x = null;
  }

  SomeClass.prototype.xx = function(yy) {
    var M;
    return M = "/ldc/src/SomeClass/SomeClass.litcoffee SomeClass::xx()\n  ";
  };

  return SomeClass;

})();

SomeClass.xx = function(yy) {
  var M;
  return M = "/ldc/src/SomeClass/SomeClass.litcoffee SomeClass.xx()\n  ";
};

Ldc = (function() {
  Ldc.prototype.C = 'Ldc';

  Ldc.prototype.toString = function() {
    return '[object Ldc]';
  };

  function Ldc(config) {
    var M;
    if (config == null) {
      config = {};
    }
    M = "/ldc/src/Ldc.litcoffee Ldc()\n  ";
    this.x = null;
  }

  Ldc.prototype.xx = function(yy) {
    var M;
    return M = "/ldc/src/Ldc.litcoffee Ldc::xx()\n  ";
  };

  return Ldc;

})();

Ldc.xx = function(yy) {
  var M;
  return M = "/ldc/src/Ldc.litcoffee Ldc.xx()\n  ";
};

if ('undefined' === typeof console || !console.log) {
  _o = function() {};
} else if ('object' === typeof console.log) {
  _o = Function.prototype.bind(console.log, console);
} else {
  _o = console.log.bind(console);
}

_o.A = 'array';

_o.B = 'boolean';

_o.D = 'document';

_o.E = 'error';

_o.F = 'function';

_o.N = 'number';

_o.O = 'object';

_o.R = 'regexp';

_o.S = 'string';

_o.U = 'undefined';

_o.X = 'null';

_o.G = _oG;

_o.T = _oT;

_o.V = _oV;

_o.is = function(c, t, f) {
  if (t == null) {
    t = true;
  }
  if (f == null) {
    f = false;
  }
  if (c) {
    return t;
  } else {
    return f;
  }
};

_o.isU = function(x) {
  return _o.U === typeof x;
};

_o.isX = function(x) {
  return null === x;
};

_o.type = function(a) {
  var ta;
  if (_o.isX(a)) {
    return _o.X;
  }
  ta = typeof a;
  if ({
    undefined: 1,
    string: 1,
    number: 1,
    boolean: 1
  }[ta]) {
    return ta;
  }
  if (!a.nodeName && a.constructor !== Array && /function/i.test('' + a)) {
    return _o.F;
  }
  return {}.toString.call(a).match(/\s([a-z0-9]+)/i)[1].toLowerCase();
};

_o.ex = function(x, a, b) {
  var pos;
  if (-1 === (pos = a.indexOf(x))) {
    return x;
  } else {
    return b.charAt(pos);
  }
};

_o.has = function(h, n, t, f) {
  if (t == null) {
    t = true;
  }
  if (f == null) {
    f = false;
  }
  if (-1 !== h.indexOf(n)) {
    return t;
  } else {
    return f;
  }
};

_o.uid = function(p) {
  return p + '_' + (Math.random() + '1111111111111111').slice(2, 18);
};

_o.insert = function(basis, overlay, offset) {
  return basis.slice(0, offset) + overlay + basis.slice(offset + overlay.length);
};

_o.redefine = function(obj, name, value, kind) {
  switch (kind) {
    case 'constant':
      return Object.defineProperty(obj, name, {
        value: value,
        enumerable: true
      });
    case 'private':
      return Object.defineProperty(obj, name, {
        value: value,
        enumerable: false
      });
  }
};

if (_o.F === typeof define && define.amd) {
  define(function() {
    return Ldc;
  });
} else if (_o.O === typeof module && module && module.exports) {
  module.exports = Ldc;
} else {
  _o.G.Ldc = Ldc;
}
}).call(this,this);
// Example vendor file. 
