
$(document).ready(function() {
	$('#btn-borrar').on('click', function(){
		var id = $('#id-borrar').val();
		var csrf = $('#csrf').val();
		
		$.ajax({
			url : "jugador/"+id,
			type: 'DELETE',
			headers: {'X-CSRF-TOKEN': csrf},
		    success: function(result) {
		    	$('tr[data-id="'+id+'"]').remove();
				var numjugadores = parseInt( $('#cantidades-jugador').text() );
		    	$('#cantidades-jugador').text(numjugadores - 1);
		    	$('#modal-confirmar-borrar').modal('hide');
		    }
		   
		});
	});
	
	$('.btn-editar').on('click', function(){
		var id = $(this).parents('tr').data('id');
		var url = 'jugador/'+id;
		
		$.get(url)
			.done(function(jugador){
				
				$('#id').val(jugador.id);
				$('#nombre').val(jugador.nombre);
				$('#edad').val(jugador.edad);
				$('#goles').val(jugador.goles);
				$('#equipos').val(jugador.equipos);
				$('#imagen').val(jugador.imagen);
				$('#form-jugador .modal-title').text ("Editando....");
				
				$('#modal-jugador').modal('show');
			});
	});
	

	$('.btn-confirmar-borrar').on('click', function(){
		var id = $(this).parents('tr').data('id');
		var url = 'jugador/'+id;
				
		$.get(url)
			.done(function(jugador){
				
				$('#id-borrar').val(jugador.id);
				$('#form-confirmar-borrar .modal-title').text ("borrando....jugador");				
				$('#modal-confirmar-borrar').modal('show');
			});
});

	

$('#modal-jugador').on('hide.bs.modal', limpiarModalEditar);

});

var limpiarModalEditar = function(){
    $('#id').val('');
    $('#nombre').val('');
    $('#edad').val('');
    $('#goles').val('');
    $('#equipos').val('');
    $('#imagen').val('');
   
    
};

	
	

