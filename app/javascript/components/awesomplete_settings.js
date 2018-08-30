const inputBar = document.getElementById('skills')

function awsompleteSettings() {
  if (inputBar) {
    new Awesomplete('#skills', {
      filter: function(text, input) {
        return Awesomplete.FILTER_CONTAINS(text, input.match(/[^,]*$/)[0]);
      },

      item: function(text, input) {
        return Awesomplete.ITEM(text, input.match(/[^,]*$/)[0]);
      },

      replace: function(text) {
        var before = this.input.value.match(/^.+,\s*|/)[0];
        this.input.value = before + text + ', ';
      }
    });

    new Awesomplete('#tags', {
      filter: function(text, input) {
        return Awesomplete.FILTER_CONTAINS(text, input.match(/[^,]*$/)[0]);
      },

      item: function(text, input) {
        return Awesomplete.ITEM(text, input.match(/[^,]*$/)[0]);
      },

      replace: function(text) {
        var before = this.input.value.match(/^.+,\s*|/)[0];
        this.input.value = before + text + ', ';
      }
    });
  }
}

export{awsompleteSettings};
