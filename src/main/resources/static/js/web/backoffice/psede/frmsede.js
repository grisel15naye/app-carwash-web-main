$(document).on("click", "#btnagregar", function(){
    $("#txtnombresede").val("");
    $("#txtsedeinfo").val("");
    $("#txtdia").val("");
    $("#txthoraabierto").val("");
    $("#txthoracierre").val("");
    $("#switchsede").hide();
    $("#cbestadosede").prop("checked", false);
    $("#hddcodsede").val("0");
    $("#modalSede").modal("show");
});

$(document).on("click", ".btnactualizar", function(){
    $("#txtnombresede").val($(this).attr("data-nombresede"));
    $("#txtsedeinfo").val($(this).attr("data-sedeinfo"));
    $("#txtdia").val($(this).attr("data-dia"));
    $("#txthoraabierto").val($(this).attr("data-horaabierto"));
    $("#txthoracierre").val($(this).attr("data-horacierre"));
    $("#switchsede").show();
    if ($(this).attr("data-estadosede") === "true"){
        $("#cbestadosede").prop("checked", true);
    } else {
        $("#cbestadosede").prop("checked", false);
    }
    $("#hddcodsede").val($(this).attr("data-sedeid"));
    $("#modalSede").modal("show");
});

$(document).on("click", "#btnguardar", function(){
    $.ajax({
        type: "POST",
        url: "/sedes/registrar",
        contentType: "application/json",
        data: JSON.stringify({
            sedeid: $("#hddcodsede").val(),
            nombresede: $("#txtnombresede").val(),
            sedeinfo: $("#txtsedeinfo").val(),
            dia: $("#txtdia").val(),
            horaabierto: $("#txthoraabierto").val(),
            horacierre: $("#txthoracierre").val(),
            estadosede: $("#cbestadosede").prop("checked")
        }),
        success: function(resultado){
            if(resultado.resultado){
                listarSedes()
            }
            alert(resultado.mensaje)
        }
    });
    $("#modalSede").modal("hide");
});

function listarSedes(){
    $.ajax({
        type: "GET",
        url: "/sedes/listar",
        dataType: "json",
        success: function(resultado){
            $("#tblsede > tbody").html("");
            $.each(resultado, function(index, value){
                $("#tblsede > tbody").append("<tr>"+
                `<td>${value.sedeid}</td>`+
                `<td>${value.nombresede}</td>`+
                `<td>${value.sedeinfo}</td>`+
                `<td>${value.dia}</td>`+
                `<td>${value.horaabierto}</td>`+
                `<td>${value.horacierre}</td>`+
                `<td>${value.estadosede}</td>`+
                `<td><button type="button" class="btn btn-info btnactualizar" `+
                ` data-sedeid="${value.sedeid}" `+
                ` data-nombresede="${value.nombresede}" `+
                ` data-sedeinfo="${value.sedeinfo}" `+
                ` data-dia="${value.dia}" `+
                ` data-horaabierto="${value.horaabierto}" `+
                ` data-horacierre="${value.horacierre}" `+
                ` data-estadosede="${value.estadosede}">Actualizar</button></td></tr>`
                )
            })
        }
    })
}
