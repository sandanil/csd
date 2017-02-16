
$(document).ready(function() {
	
	$('#btn-borrar').on('click', function(){
		var id = $('#id-borrar').val();
		var csrf = $('#csrf').val();
		
		$.ajax({
			url : "federacion/"+id,
			type: 'DELETE',
			headers: {'X-CSRF-TOKEN': csrf},
		    success: function(result) {
		    	$('tr[data-id="'+id+'"]').remove();
				var numfederaciones = parseInt( $('#cantidades-federacion').text() );
		    	$('#cantidades-federacion').text(numfederaciones - 1);
		    	$('#modal-confirmar-borrar').modal('hide');
		    }
		});
	});
	
	$('.btn-editar').on('click', function(){
		var id = $(this).parents('tr').data('id');
		var url = 'federacion/'+id;
		
		$.get(url)
			.done(function(federacion){
				
				$('#id').val(federacion.id);
				$('#nombre').val(federacion.nombre);
				$('#pais').val(federacion.pais);
				$('#imagen').val(federacion.imagen);
				$('#form-federacion .modal-title').text ("Editando....");
				
				$('#modal-federacion').modal('show');
			});
	});
	$('.btn-confirmar-borrar').on('click', function(){
		var id = $(this).parents('tr').data('id');
		var url = 'federacion/'+id;
				
		$.get(url)
			.done(function(federacion){
				
				$('#id-borrar').val(federacion.id);
				$('#form-confirmar-borrar .modal-title').text ("borrando....federacion");				
				$('#modal-confirmar-borrar').modal('show');
			});
	});
	

            $('#modal-federacion').on('hide.bs.modal', limpiarModalEditar);

});

var limpiarModalEditar = function(){
    $('#id').val('');
    $('#nombre').val('');
    $('#pais').val('');
    $('#imagen').val('');
}; 
