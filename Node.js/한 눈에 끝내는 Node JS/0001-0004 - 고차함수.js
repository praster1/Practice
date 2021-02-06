var ho_func = function (param_func) { param_func(); };
ho_func(function () { console.log("hello!"); });
// hello!