$(document).on("click", "#btnagregar", function(){
    $("#cbosede").empty();
    listarSedeProg(0)
    $("#txtfecha").val("");
    $("#txthoraprogramada").val("");
    $("#hddcodprog").val("0");
    $("#modalprogramacion").modal("show");
});

$(document).on("click", ".btnactualizar", function(){
    $("#cbosede").empty();
    listarSedeProg($(this).attr("data-progsede"));
    $("#txtfecha").val($(this).attr("data-progfecha"));
    $("#txthoraprogramada").val($(this).attr("data-proghoraprogramada"));
    $("#hddcodprog").val($(this).attr("data-progcod"));
    $("#modalprogramacion").modal("show");
});

$(document).on("click", "#btnguardar", function(){
    $.ajax({
        type: "POST",
        url: "/programaciones/registrar",
        contentType: "application/json",
        data: JSON.stringify({
            programacionid: $("#hddcodprog").val(),
            sedeid: $("#cbosede").val(),
            fecha: $("#txtfecha").val(),
            horaprogramada: $("#txthoraprogramada").val(),

        }),
        success: function(resultado){
            if(resultado.resultado){
                listarProgramacion();
            }
            alert(resultado.mensaje);
        }
    });
    $("#modalprogramacion").modal("hide");
});

function listarProgramacion(){
    $.ajax({
        type: "GET",
        url: "/programaciones/listar",
        dataType: "json",
        success: function(resultado){
            $("#tblprogramacion > tbody").html("");
            $.each(resultado, function(index, value){
                $("#tblprogramacion > tbody").append("<tr>"+
                `<td>${value.programacionid}</td>`+
                `<td>${value.nombresede}</td>`+
                `<td>${value.fecha}</td>`+
                `<td>${value.horaprogramada}</td>`+
                `<td><button type="button" class="btn btn-info btnactualizar" `+
                ` data-progcod="${value.codprog}" `+
                ` data-progsede="${value.sedeid}" `+
                ` data-progfecha="${value.fecha}" `+
                ` data-proghoraprogramada="${value.horaprogramada}">Actualizar</button></td></tr>`
                );
            });
        }
    });
}

function listarSedeProg(idsede){
    $.ajax({
    type: "GET",
    url: "/sedes/listar",
    dataType: "json",
    success: function(resultado){
        $.each(resultado, function(index, value){
            $("#cbosede").append(
            `<option value="${value.sedeid}">${value.nombresede}</option>`
            )
        });
    }
    });
}


