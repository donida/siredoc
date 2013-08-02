// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require turbolinks
//= require_tree .
function carregar_cidades_div(estado_id) {
	jQuery.ajax({
		url : "/update_cidades",
		type : "GET",
		dataType : "json",
		contentType : "application/json",
		data : {
			"estado_id" : estado_id
		},
		success : function(data) {
			var select = jQuery('#cartorio_cidade_id');
			var options = null;
			if(select.prop)
				options = select.prop('options');
			else
				options = select.attr('options');
			var temp = options[0];			
			$('option', select).remove();
			options[options.length] = temp;
			if (!$.isArray(data))
				data = [data];
			$.each(data, function(pos, obj) {
				options[options.length] = new Option(obj.nome, obj.id)
			});
		}
	});
}

function carregar_atribuicoes_div(tipoRegistro_id) {
	jQuery.ajax({
		url : "/update_atribuicoes",
		type : "GET",
		dataType : "json",
		contentType : "application/json",
		data : {
			"tipoRegistro_id" : tipoRegistro_id
		},
		success : function(data) {
			var select = jQuery('#cartorio_atribuicao_id');
			var options = null;
			if(select.prop)
				options = select.prop('options');
			else
				options = select.attr('options');
			var temp = options[0];			
			$('option', select).remove();
			options[options.length] = temp;
			if (!$.isArray(data))
				data = [data];
			$.each(data, function(pos, obj, a, b) {
				options[options.length] = new Option(obj.nome, obj.id);
			});
		}
	});
}