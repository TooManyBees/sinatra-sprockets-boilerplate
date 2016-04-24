(function() {
  Element.prototype.removeClass = function(name) {
    if (this.classList.includes(name)) {
      this.classList.remove(name);
    }
  }

  Element.prototype.addClass = function(name) {
    if (!this.classList.includes(name)) {
      this.classList.add(name);
    }
  }

  if (typeof Array.prototype.includes !== "function") {
    Array.prototype.includes = function(elem) {
      return this.indexOf(elem) > -1;
    }
  }

  var descriptor = {
    enumerable: true,
    get: function() {
      return [this.protocol, "//", this.host].join("");
    },
  }
  if (typeof window.location.origin === "undefined") {
    Object.defineProperty(window.location, 'origin', descriptor);
  }
  if (typeof document.location.origin === "undefined") {
    Object.defineProperty(document.location, 'origin', descriptor);
  }
})();
