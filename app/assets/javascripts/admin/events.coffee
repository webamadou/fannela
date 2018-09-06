# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
  dataTable = $("#eventdatatable").dataTable({
    ajax: '/get_dataset',
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
        result = '<a href="/events/'+row['id']+'"><button class="btn btn-success btn-xs"><i class="fa fa-eye"></i>Show</button></a> <br/> <a href="/events/'+row['id']+'/edit"><button class="btn btn-primary btn-xs"><i class="fa fa-eye"></i>Edit</button></a> <br/> <a data-confirm="Are you sure?" rel="nofollow" data-method="delete" href="/events/'+row['id']+'"><button class="btn btn-danger btn-xs"><i class="fa fa-eye"></i>Destroy</button></a> <br/>'
        result
      'targets': 5
    } ],
    columns: [
      {title: 'Title', data: 'title'},
      {title: 'Start Date', data: 'startdate'},
      {title: 'Description', data: 'description'},
      {title: 'Drive Link', data: 'category.name'},
      {title: 'State', data: 'country.name'}
      {title: 'action', data: 'nil'}
    ],
    responsive: true,
    "iDisplayLength": 100   ,
    "oLanguage":{
      "sProcessing":     "Traitement en cours...",
      "sSearch":         "Rechercher&nbsp;:",
      "sLengthMenu":     "Afficher _MENU_ &eacute;l&eacute;ments",
      "sInfo":           "Affichage de l'&eacute;lement _START_ &agrave; _END_ sur _TOTAL_ &eacute;l&eacute;ments",
      "sInfoEmpty":      "Affichage de l'&eacute;lement 0 &agrave; 0 sur 0 &eacute;l&eacute;ments",
      "sInfoFiltered":   "(filtr&eacute; de _MAX_ &eacute;l&eacute;ments au total)",
      "sInfoPostFix":    "",
      "sLoadingRecords": "Chargement en cours...",
      "sZeroRecords":    "Aucun &eacute;l&eacute;ment &agrave; afficher",
      "sEmptyTable":     "Aucune donnée disponible dans le tableau",
      "oPaginate": {
        "sFirst":      "<< ",
        "sPrevious":   "Prec",
        "sNext":       " Suiv",
        "sLast":       " >>"
      },
      "oAria": {
        "sSortAscending":  ": activer pour trier la colonne par ordre croissant",
        "sSortDescending": ": activer pour trier la colonne par ordre décroissant"
      }
    },
  });