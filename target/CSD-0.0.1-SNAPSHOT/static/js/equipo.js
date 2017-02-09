
$(document).ready(function() {	
	$('#btn-borrar').on('click', function(){
		var id = $('#id-borrar').val();
		var csrf = $('#csrf').val();
		
		$.ajax({
			url : "equipos/"+id,
			type: 'DELETE',
			headers: {'X-CSRF-TOKEN': csrf},
		    success: function(result) {
		    	$('tr[data-id="'+id+'"]').remove();
				var numequipos = parseInt( $('#cantidades-equipos').text() );
		    	$('#cantidades-equipos').text(numequipos - 1);
		    	$('#modal-confirmar-borrar').modal('hide');
		    }
		});
	});
	
	$('.btn-editar').on('click', function(){
		var id = $(this).parents('tr').data('id');
		var url = 'equipos/'+id;
		
		$.get(url)
			.done(function(equipo){
				
				$('#id').val(equipo.id);
				$('#nombre').val(equipo.nombre);
				$('#estadio').val(equipo.estadio);
				$('#presupuesto').val(equipo.presupuesto);
				$('#federaciones').val(equipo.federaciones);
				$('#form-equipos .modal-title').text ("Editando....");
				
				$('#modal-equipos').modal('show');
			});
	});
	

	$('.btn-confirmar-borrar').on('click', function(){
		var id = $(this).parents('tr').data('id');
		var url = 'equipos/'+id;
				
		$.get(url)
			.done(function(equipo){
				
				$('#id-borrar').val(equipo.id);
				$('#form-confirmar-borrar .modal-title').text ("borrando....equipo");				
				$('#modal-confirmar-borrar').modal('show');
			});
});

$('#modal-equipos').on('hide.bs.modal', limpiarModalEditar);

});

var limpiarModalEditar = function(){
    $('#id').val('');
    $('#nombre').val('');
    $('#estadio').val('');
    $('#presupuesto').val('');
    $('#federaciones').val('');
   
    
};
