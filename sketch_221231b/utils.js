function repeat(n, fn) {
  for (let ix = 0; ix < n; ix++) {
    fn(ix);
  }
}


function collect(n, fn) {
  const res = [];
  for (let i = 0; i < n; i++) {
    res.push(fn(i));
  }
  return res;
}
