$(document).on("click", "#btnagregar", function() {
    // Limpiar los campos del modal
    $("#txtnombresede").val("");
    $("#txtsedeinfo").val("");
    $("#cblunes").prop("checked", false);
    $("#cbmartes").prop("checked", false);
    $("#cbmiercoles").prop("checked", false);
    $("#cbjueves").prop("checked", false);
    $("#cbviernes").prop("checked", false);
    $("#cbsabado").prop("checked", false);
    $("#cbdomingo").prop("checked", false);
    $("#txthoraabierto").val("");
    $("#txthoracierre").val("");
    $("#switchsede").hide();
    $("#cbestadosede").prop("checked", false);
    $("#hddcodsede").val("0");
    $("#modalSede").modal("show");
});

$(document).on("click", ".btnactualizar", function() {
    $("#txtnombresede").val($(this).attr("data-nombresede"));
    $("#txtsedeinfo").val($(this).attr("data-sedeinfo"));
    $("#cblunes").prop("checked", $(this).attr("data-lunes") === "true");
    $("#cbmartes").prop("checked", $(this).attr("data-martes") === "true");
    $("#cbmiercoles").prop("checked", $(this).attr("data-miercoles") === "true");
    $("#cbjueves").prop("checked", $(this).attr("data-jueves") === "true");
    $("#cbviernes").prop("checked", $(this).attr("data-viernes") === "true");
    $("#cbsabado").prop("checked", $(this).attr("data-sabado") === "true");
    $("#cbdomingo").prop("checked", $(this).attr("data-domingo") === "true");
    $("#txthoraabierto").val($(this).attr("data-horaabierto"));
    $("#txthoracierre").val($(this).attr("data-horacierre"));
    $("#switchsede").show();
    $("#cbestadosede").prop("checked", $(this).attr("data-estadosede") === "true");
    $("#hddcodsede").val($(this).attr("data-sedeid"));
    $("#modalSede").modal("show");
});

$(document).on("click", "#btnguardar", function() {
    $.ajax({
        type: "POST",
        url: "/sedes/registrar",
        contentType: "application/json",
        data: JSON.stringify({
            sedeid: $("#hddcodsede").val(),
            nombresede: $("#txtnombresede").val(),
            sedeinfo: $("#txtsedeinfo").val(),
            lunes: $("#cblunes").prop("checked"),
            martes: $("#cbmartes").prop("checked"),
            miercoles: $("#cbmiercoles").prop("checked"),
            jueves: $("#cbjueves").prop("checked"),
            viernes: $("#cbviernes").prop("checked"),
            sabado: $("#cbsabado").prop("checked"),
            domingo: $("#cbdomingo").prop("checked"),
            horaabierto: $("#txthoraabierto").val(),
            horacierre: $("#txthoracierre").val(),
            estadosede: $("#cbestadosede").prop("checked")
            }),
            success: function(resultado){
                if(resultado.resultado){
                    listarSedes();
                }
                alert(resultado.mensaje);
            }
        }),
    $("#modalSede").modal("hide");
});

function listarSedes() {
    $.ajax({
        type: "GET",
        url: "/sedes/listar",
        dataType: "json",
        success: function(resultado) {
            $("#tblsede > tbody").html("");
            $.each(resultado, function(index, value) {
                $("#tblsede > tbody").append("<tr>" +
                    `<td>${value.sedeid}</td>` +
                    `<td>${value.nombresede}</td>` +
                    `<td>${value.sedeinfo}</td>` +
                    `<td>${value.lunes ? 'Sí' : 'No'}</td>` +
                    `<td>${value.martes ? 'Sí' : 'No'}</td>` +
                    `<td>${value.miercoles ? 'Sí' : 'No'}</td>` +
                    `<td>${value.jueves ? 'Sí' : 'No'}</td>` +
                    `<td>${value.viernes ? 'Sí' : 'No'}</td>` +
                    `<td>${value.sabado ? 'Sí' : 'No'}</td>` +
                    `<td>${value.domingo ? 'Sí' : 'No'}</td>` +
                    `<td>${value.horaabierto}</td>` +
                    `<td>${value.horacierre}</td>` +
                    `<td>${value.estadosede ? 'activo' : 'inactivo'}</td>` +

                    `<td><button type="button" class="btn btn-info btnactualizar" ` +
                    `data-sedeid="${value.sedeid}" ` +
                    `data-nombresede="${value.nombresede}" ` +
                    `data-sedeinfo="${value.sedeinfo}" ` +
                    `data-lunes="${value.lunes}" ` +
                    `data-martes="${value.martes}" ` +
                    `data-miercoles="${value.miercoles}" ` +
                    `data-jueves="${value.jueves}" ` +
                    `data-viernes="${value.viernes}" ` +
                    `data-sabado="${value.sabado}" ` +
                    `data-domingo="${value.domingo}" ` +
                    `data-horaabierto="${value.horaabierto}" ` +
                    `data-horacierre="${value.horacierre}" ` +
                    `data-estadosede="${value.estadosede}">Actualizar</button></td></tr>`
                );
            });
        }
    });
}

