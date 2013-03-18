function setSongPositions() {
  $("#playlist-songs").find('tr .position').each(function(index) {
    $(this).html(index + 1);
  });
}

$(window).ready(function() {

  setSongPositions();

  $("#playlist-songs").sortable({
    axis: 'y',
    items: 'tr',
    handle: '.drag',
    cursor: 'move',
    update: function(event, ui) {
      $.post(ui.item.data('update-url'), {
        _method: 'PUT',
        id: ui.item.data('id'),
        song: { row_order_position: ui.item.index() }
      }, setSongPositions);
    }
  });
});
