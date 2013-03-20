function ns(name, callback) {
  var base  = window;
  var parts = name.split('.');

  for(var i = 0; i < parts.length; ++i) {
    base[parts[i]] = (base[parts[i]] || { });
    base = base[parts[i]];
  }

  return callback(base);
}
