/* Shared by every generated page (landing and documentation). */
(function () {
  var root = document.documentElement;

  /* Theme toggle. */
  var btn = document.getElementById('themeToggle');
  if (btn) {
    var label = function () {
      var t = root.getAttribute('data-theme') !== 'light' ? 'Switch to day mode' : 'Switch to night mode';
      btn.setAttribute('aria-label', t); btn.setAttribute('title', t);
    };
    btn.addEventListener('click', function () {
      var next = root.getAttribute('data-theme') === 'light' ? 'dark' : 'light';
      root.setAttribute('data-theme', next);
      try { localStorage.setItem('bcapi-theme', next); } catch (e) {}
      label();
    });
    label();
  }
  var yr = document.getElementById('year'); if (yr) yr.textContent = new Date().getFullYear();

  /* Every external link opens in a new tab. */
  Array.prototype.forEach.call(document.querySelectorAll('a[href]'), function (a) {
    if (a.host && a.host !== location.host && /^https?:/.test(a.protocol)) { a.target = '_blank'; a.rel = (a.rel ? a.rel + ' ' : '') + 'noopener'; }
  });

  /* Open the entity (<details>) that the URL fragment points at. */
  function openTarget() {
    var id; try { id = decodeURIComponent(location.hash.slice(1)); } catch (e) { return; }
    var el = id && document.getElementById(id);
    if (el && el.tagName === 'DETAILS') { el.open = true; el.scrollIntoView(); }
  }
  openTarget();
  window.addEventListener('hashchange', openTarget);

  /* The hero bar ends under the full stop of bcapi.ai. */
  var bar = document.querySelector('.hero .bar'), dot = document.querySelector('.hero .wm .dot');
  if (bar && dot) {
    var fitBar = function () { bar.style.width = Math.round(dot.getBoundingClientRect().right - bar.getBoundingClientRect().left) + 'px'; };
    fitBar(); window.addEventListener('resize', fitBar); if (document.fonts) document.fonts.ready.then(fitBar);
  }

  /* A soft light follows the pointer across the hero band (pointer devices only). */
  var band = document.querySelector('.hero-band');
  if (band && window.matchMedia && window.matchMedia('(hover: hover) and (pointer: fine)').matches) {
    band.addEventListener('pointermove', function (e) {
      var r = band.getBoundingClientRect();
      band.style.setProperty('--mx', (e.clientX - r.left) + 'px'); band.style.setProperty('--my', (e.clientY - r.top) + 'px');
      band.classList.add('lit');
    });
    band.addEventListener('pointerleave', function () { band.classList.remove('lit'); });
  }

  /* Landing hero stage: a record types itself between the braces, the route line and the lit consumer follow it,
     and the wires are drawn from the real positions of the BC icon, the braces and the chips. */
  var stage = document.getElementById('stage');
  if (stage) {
    var records = [
      { m: 'GET', e: 'ocpfCustomers', f: [['no', 'C00010'], ['name', 'Adatum Corporation'], ['city', 'Atlanta'], ['balanceLCY', 12480], ['blocked', '']], d: 1 },
      { m: 'GET', e: 'ocpfItems', f: [['no', '1896-S'], ['description', 'ATHENS Desk'], ['unitPrice', 1000.8], ['inventory', 21], ['routingNo', '1896-S']], d: 0 },
      { m: 'POST', e: 'ocpfSalesOrders', f: [['no', 'S-ORD101001'], ['orderDate', '2026-10-12'], ['status', 'Open'], ['amountInclVat', 4280]], d: 1 },
      { m: 'GET', e: 'ocpfGeneralLedgerEntries', f: [['entryNo', 1042], ['gLAccountNo', '6110'], ['postingDate', '2026-10-12'], ['amount', -1250]], d: 2 },
      { m: 'PATCH', e: 'ocpfVendors', f: [['no', 'V00020'], ['name', 'Fabrikam, Inc.'], ['paymentTerms', '30 DAYS'], ['blocked', '']], d: 1 },
      { m: 'GET', e: 'ocpfProductionOrders', f: [['no', '101003'], ['status', 'Released'], ['sourceNo', '1896-S'], ['quantity', 40]], d: 0 }
    ];
    var rec = document.getElementById('st-rec'), rm = document.getElementById('st-m'), rp = document.getElementById('st-p'),
        chips = Array.prototype.slice.call(stage.querySelectorAll('.dst .chip')),
        reduce = window.matchMedia && window.matchMedia('(prefers-reduced-motion: reduce)').matches, n = 0;
    var recHtml = function (r) {
      return r.f.map(function (p) {
        var v = p[1], num = typeof v === 'number';
        return ' <span class="k">"' + p[0] + '"</span>: <span class="' + (num ? 'n' : 's') + '">' + (num ? v.toFixed(v % 1 ? 2 : 0) : '"' + v.replace(/</g, '&lt;') + '"') + '</span>';
      }).join(',\n');
    };
    var typeOut = function (full, done) {
      var shown = 0, total = full.replace(/<[^>]+>/g, '').length;
      (function step() {
        shown += 2;
        var out = '', cnt = 0, m, re = /(<[^>]+>)|([^<])/g;
        while ((m = re.exec(full)) && cnt < shown) { if (m[1]) out += m[1]; else { out += m[2]; cnt++; } }
        rec.innerHTML = out + '<span class="cur"></span>';
        if (cnt < total) setTimeout(step, 14); else done();
      })();
    };
    (function next() {
      var r = records[n++ % records.length];
      rm.textContent = r.m; rp.innerHTML = rp.innerHTML.replace(/<b>.*<\/b>/, '<b>' + r.e + '</b>');
      chips.forEach(function (c, k) { c.classList.toggle('on', k === r.d); });
      if (reduce) { rec.innerHTML = recHtml(r); setTimeout(next, 5000); return; }
      rec.innerHTML = '<span class="cur"></span>';
      typeOut(recHtml(r), function () { setTimeout(next, 2600); });
    })();
    /* The ticker runs at a reading pace, 32px a second, whatever its length (the track holds every entity twice). */
    var track = stage.querySelector('.ticker .track');
    track.style.animationDuration = Math.round(track.scrollWidth / 2 / 32) + 's';
    var wire = function (x1, y1, x2, y2) { var mx = (x1 + x2) / 2; return 'M' + x1 + ' ' + y1 + ' C ' + mx + ' ' + y1 + ', ' + mx + ' ' + y2 + ', ' + x2 + ' ' + y2; };
    var layout = function () {
      var flow = stage.querySelector('.flow'), fr = flow.getBoundingClientRect(), src = stage.querySelector('.src .ic');
      if (!src.offsetParent) return;  /* phones: no wires */
      var rel = function (el) { var r = el.getBoundingClientRect(); return { l: r.left - fr.left, r: r.right - fr.left, cy: r.top - fr.top + r.height / 2 }; };
      document.getElementById('st-wires').setAttribute('viewBox', '0 0 ' + fr.width + ' ' + fr.height);
      var s = rel(src), bl = rel(stage.querySelector('.braces .b.l')), br = rel(stage.querySelector('.braces .b.r'));
      document.getElementById('st-w0').setAttribute('d', wire(s.r + 4, s.cy, bl.l + 6, bl.cy));
      chips.forEach(function (c, k) { var d = rel(c); document.getElementById('st-w' + (k + 1)).setAttribute('d', wire(br.r - 6, br.cy, d.l - 2, d.cy)); });
    };
    layout(); window.addEventListener('resize', layout); if (document.fonts) document.fonts.ready.then(layout);
  }

  /* Reference hub: search every entity, table, page ID and field. catalog.json is fetched on first use. */
  var input = document.getElementById('ref-search'), list = document.getElementById('ref-results');
  if (input && list) {
    var hub = document.getElementById('ref-hub'), count = document.getElementById('ref-count'), data = null, loading = false;
    var esc = function (s) { return String(s).replace(/[&<>"]/g, function (c) { return { '&': '&amp;', '<': '&lt;', '>': '&gt;', '"': '&quot;' }[c]; }); };
    var load = function (cb) {
      if (data) return cb();
      if (loading) return;
      loading = true;
      fetch('/catalog.json').then(function (r) { return r.json(); }).then(function (j) { data = j; cb(); })
        .catch(function () { loading = false; count.textContent = 'Search is unavailable right now; browse the categories below.'; });
    };
    var run = function () {
      var q = input.value.trim().toLowerCase();
      if (!q) { list.innerHTML = ''; hub.hidden = false; count.textContent = ''; return; }
      var html = '', n = 0, total = 0;
      data.categories.forEach(function (c) {
        c.entities.forEach(function (e) {
          var hit = e.n.toLowerCase().indexOf(q) >= 0 || e.t.toLowerCase().indexOf(q) >= 0 || String(e.i) === q;
          for (var k = 0; !hit && k < e.f.length; k++) hit = e.f[k][0].toLowerCase().indexOf(q) >= 0 || e.f[k][1].toLowerCase().indexOf(q) >= 0;
          if (!hit) return;
          total++;
          if (n < 100) { n++; html += '<li><a href="/reference/' + c.slug + '/#' + esc(e.n) + '">' + esc(e.n) + '</a><small>' + esc(e.t) + ' · page ' + e.i + ' · ' + esc(c.name) + '</small></li>'; }
        });
      });
      hub.hidden = true;
      list.innerHTML = html || '<li class="empty">Nothing matches. Try an entity name, a BC table name, a page ID or a field identifier.</li>';
      count.textContent = total + ' of ' + data.total + ' endpoints' + (total > n ? ' (showing ' + n + ')' : '');
    };
    input.addEventListener('focus', function () { load(function () {}); });
    input.addEventListener('input', function () { load(run); });
  }
})();
