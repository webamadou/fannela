# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
  $(document).ready ->
  dataTable = $('#eventdatatable').DataTable(
    ajax: '/get_dataset'
    sDom: 'lrptirp'
    responsive: true
    "columnDefs": [ {
      'render': (data, type, row) ->
        result = if row['startdate']!=null then row['startdate'] + ' ' + row['enddate'] else 'undefined'
        result
      'targets': 1
    },{
      'render': (data, type, row) ->
        result = row['category']['name'] + ' ' + row['country']['name']
        result
      'targets': 4
    },{
      'render': (data, type, row) ->
        result = '<a href="/events/'+row['id']+'" class="popUpBtn"><i class="fas fa-2x fa-eye"></i></a>'
        result
      'targets': 5
    } ]
    'order': [ [
      1
      'asc'
    ] ]
    columns: [
      {title: 'Title', data: 'title'},
      {title: 'Start Date', data: 'startdate'},
      {title: 'Description', data: 'description'},
      {title: 'Drive Link', data: 'category.name'},
      {title: 'State', data: 'country.name'}
      {title: 'action', data: 'nil'}
    ]
    'iDisplayLength': 50
    'oLanguage':
      'sProcessing': 'Traitement en cours...'
      'sSearch': 'Rechercher&nbsp;:'
      'sLengthMenu': 'Afficher _MENU_ &eacute;l&eacute;ments'
      'sInfo': 'Affichage de l\'&eacute;lement _START_ &agrave; _END_ sur _TOTAL_ &eacute;l&eacute;ments'
      'sInfoEmpty': 'Affichage de l\'&eacute;lement 0 &agrave; 0 sur 0 &eacute;l&eacute;ments'
      'sInfoFiltered': '(filtr&eacute; de _MAX_ &eacute;l&eacute;ments au total)'
      'sInfoPostFix': ''
      'sLoadingRecords': 'Chargement en cours...'
      'sZeroRecords': 'Aucun &eacute;l&eacute;ment &agrave; afficher'
      'sEmptyTable': 'Aucune donnée disponible dans le tableau'
      'oPaginate':
        'sFirst': '<| '
        'sPrevious': 'Prec'
        'sNext': ' Suiv'
        'sLast': ' |>'
      'oAria':
        'sSortAscending': ': activer pour trier la colonne par ordre croissant'
        'sSortDescending': ': activer pour trier la colonne par ordre décroissant'
    initComplete: ->
      txt = '<div class="fieldOrderBy"><label>Ordonner par date </label> <select id="selectOrder" name="selectOrder"><option value="1" rel="asc">...</option><option value="0" rel="ASC">enregistrements récents</option><option value="0" rel="DESC">enregistrements anciens</option></select></div>'
      $('#events_length').prepend txt
      $('#planners_length').prepend txt
      return
    'drawCallback': (settings) ->
      $('html, body').animate { scrollTop: 0 }, 'slow'
      $('#datatableContent').delay(500).fadeIn('slow').show()
      $('.tableLoader').delay(800).fadeOut()
      return
  )
  $('#searchengine').keyup ->
    dataTable.search(@value).draw()
    return
  $('select#selectOrder').change (e) ->
    column = $(this).val()
    selectOption = $('select#selectOrder option[value="' + column + '"]')
    orderby = selectOption.attr('rel')
    dataTable.order([
      column
      orderby
    ]).draw()
    return
  return
###
  $("#searchengine").keyup(function() {
    dataTable.search(this.value).draw();
  })###
