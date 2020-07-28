var divBody = "*";
var modo = 0;

$(document).ready(function () {

    $(divBody).find("select").each(function () {
        var Retornar = true;
        if ($(this).attr("data-GERA") !== undefined) {
            if ($(this).attr("data-GERA").indexOf("_SI") > -1) {
                llenaCombo($(this).attr("id").substr(3));
            }
        }
    });


    $(divBody).find("input, select, textarea, password, table").each(function () {
        var data = $(this).attr("id");
        if ($(this).attr("data-decss") !== undefined) {
            estiloPugging(data);
        }

    });


});


function ReCargarPlugin() {
    $(divBody).find("select").each(function () {
        var Retornar = true;
        if ($(this).attr("data-GERA") !== undefined) {
            if ($(this).attr("data-GERA").indexOf("_SI") > -1) {
                llenaCombo($(this).attr("id").substr(3));
            }
        }
    });
    $(divBody).find("input, select, textarea, password, table").each(function () {
        var data = $(this).attr("id");
        if ($(this).attr("data-decss") !== undefined) {
            estiloPugging(data);
        }

    });
}




function mostrarCargador() {
    tiempoInicio = new Date();
    if ($("#processing-modal").is(":visible") !== true) {
        $("#processing-modal").modal({
            //keyboard: false,
            //backdrop: 'static'
        });
    }
}

function ocultarCargador() {
    tiempofinal = new Date();
    var tiempo = ((tiempofinal - tiempoInicio) / 1000);
    if (tiempo > 0.5) {
        ocultarCargador2();
    }
    else {
        setTimeout(ocultarCargador2, 1000);
    }
}
function ocultarCargador2() {
    $('#processing-modal').addClass("aria-hidden='true'");
    $('#processing-modal').modal('hide');
    $('body').css('padding-right', '');

}


function msjAlert(msj) {
    toastr.error(msj);


    //// for success - green box
    //toastr.success('Success messages');

    //// for warning - orange box
    //toastr.warning('warning messages');

    //// for info - blue box
    //toastr.info('info messages');
}



function MensajeAlerta(IDMSJ, TextMSJ) {
    var Error = "";
    switch (IDMSJ) {
        case 1:
            toastr.error(msj);
            break;
        case 2:
            toastr.success(TextMSJ);
            limpiarGeneralTodo();

            break;
        default:
            Error = "Error No Identificado"
            toastr.error(Error);
            return Error;
    }
}


function limpiarGeneralTodo() {
    limpiarCampoTodo("_L");
}

function limpiarCampoTodo(indica) {
    registro = '';
    modo = 0;
    modoTabla = 0;
    regEspecial = "";
    $(divBody).find("input, select, textarea, password, table").each(function () {
        var data = $(this).attr("data-GERA");
        if (data != undefined) {

            var tipo = $(this)[0].id.substring(0, 3).toUpperCase();

            switch (tipo) {
                case 'TXAT':
                    tinyMCE.get(this.id).setContent('');
                    break;
                case 'TAB':
                    $("#" + $(this).attr("id") + ' tbody tr').each(function () {
                        $(this).remove();
                    });
                    break;
                case 'TXT':
                    $(this).val('');
                    break;
                default:
                    return false;
            }

        }
    });
}

function llenaCombo(idCampo) {
    llenaComboWhere(idCampo, " ");
}


function llenaComboWhere(idCampo, where) {
    var campo1 = idCampo;
    if (idCampo.indexOf("_0") > -1) {
        idCampo = idCampo.substring(0, campo1.length - 2);
    } else {
        idCampo = idCampo;
    }


    var param = "'idCampo':'" + idCampo + "','where':'" + where + "'";
    $.ajax({
        type: "POST",
        async: false,
        url: "gera.aspx/llenaComboWhere",
        data: "{" + param + "}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {
            m = response.d;
            idCampo = campo1;
            $('#ddl' + idCampo).find('option').remove().end();
            $.each(m, function (val, text) {
                $('#ddl' + idCampo).append($('<option></option>').val(text.Value).html(text.Text));
            });
            return false;
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            //    //  OcultarProgreso();
            var msj = "Respuesta = " + XMLHttpRequest.responseText + "\n Estatus = " + textStatus + "\n Error = " + errorThrown + "llenaComboCondiciones";
        }
    });
}


$(document).on("click", "#CrearListaDDL", function (e) {
    e.preventDefault;
    alert("Crear Lista")


});


$(document).on("click", ".Administrar", function (e) {
    e.preventDefault;
    AdministrarPaginas($(this).attr("id"));
    ReCargarPlugin();
});

function AdministrarPaginas(IDPagina) {
    var Error = "";
    switch (IDPagina) {
        case "CrearLista":
            $("#Div" + IDPagina).empty();


            var asas = '';
            $("#Div" + IDPagina).load("HtmlPage1.html div#DivListaT", function (response, status, xhr) {
                asas = response;
            });
            $("#Div" + IDPagina).empty();
            $("#Div" + IDPagina).html(asas)
            $('#CrearListaModal').modal();
            break;

        case "":

            break;
        default:
            Error = "Error No Identificado"
            return Error;
    }
}


$(document).on("click", "#AgregarValorLista", function (e) {
    e.preventDefault;
    AgregarValorLista();
    $("#txtValorLista").focus();
})
function AgregarValorLista() {
    var Valor = $("#txtValorLista").val();
    var Estatus = $("#dllEstatusLista").val();
    var fila;
    var Botones;

    if (Valor !== "") {
        Botones = " <span class='badge bg-danger m-0'>"
        Botones += "<a href='#'><i class='fas fa-minus-circle'></i></a>"
        Botones += "</span >"

        Botones += " <span class='badge bg-warning m-0'>"
        Botones += "<a href='#'><i class='fas fa-pen'></i></a>"
        Botones += "</span >"

        fila = "<td>" + Valor + "</td>"
        fila += "<td>" + Estatus + "</td>"
        fila += "<td>" + Botones + "</td>"

        $('#tabTab_Crear_LIsta').append($('<tr></tr>').html(fila));
        $("#txtValorLista").val("");
        $("#txtValorLista").focus();
    } else {
        alert("El Nombre de Valor esta En Blanco")
        $("#txtValorLista").focus();
    }

}



$(document).on("click", "#btnGuardarCrearLista", function (e) {
    e.preventDefault;
    if ($("#txtNombreLista").val() == "") {
        MensajeAlerta(1, "Favor Especificar Nombre de Campo")
    } else {
        CrearLista();
    }

});



function CrearLista() {
    var NombreLista = $("#txtNombreLista").val();
    var ValoresLista = "";
    var msj = "";
    $('#tabTab_Crear_LIsta tbody tr').each(function () {
        var Valor1 = $(this).find("td").eq(0).html();
        var Valor2 = $(this).find("td").eq(1).html();
        ValoresLista += Valor1 + "=" + Valor2 + "|";

    });

    if (ValoresLista == "") {
        MensajeAlerta(1, "Favor Especificar Valor de Lista")
    } else {
        var param = "'modo':'0','ValoresLista':'" + ValoresLista + "','NombreLista':'" + NombreLista + "'";
        mostrarCargador();
        $.ajax({
            type: "POST",
            async: true,
            url: "gera.aspx/CrearLista",
            data: "{" + param + "}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (response) {
                ocultarCargador();
                var m = response.d.split("|");
                if (m[0] == -1) {
                    msj = "Ha ocurrido un error en la ejecucion de esta peticion....";
                    MensajeAlerta(1, msj)
                }

                if (m[0] == 0) {
                    msj = "Lista " + m[1] + " grabada satisfactoriamente...";
                    MensajeAlerta(2, msj)
                }
                return false;
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                ocultarCargador();
                var msj = "Respuesta = " + XMLHttpRequest.responseText + "\n Estatus = " + textStatus + "\n Error = " + errorThrown + "llenaComboCondiciones";
                MensajeAlerta(1, msj)
            }
        });
    }


}





$(document).on("change", "#ddlEditarLista", function (e) {
    e.preventDefault;
    if ($('select[id="ddlEditarLista"] option:selected').val() == "") {
        MensajeAlerta(1, "Favor Especificar Nombre de Campo")
    } else {
        EditarLista();
    }

});



function EditarLista() {
    var IDLista = $('select[id="ddlEditarLista"] option:selected').val()
    var msj = "";

    if (IDLista == "") {
        MensajeAlerta(1, "Favor Seleccione una Lista")
    } else {
        var param = "'modo':'0','IDLista':'" + IDLista + "'";
        mostrarCargador();
        $.ajax({
            type: "POST",
            async: true,
            url: "gera.aspx/EditarLista",
            data: "{" + param + "}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (response) {
                ocultarCargador();
                var m = response.d.split("|");
                if (m[0] == -1) {
                    msj = "Ha ocurrido un error en la ejecucion de esta peticion....";
                    MensajeAlerta(1, msj)
                }

                if (m[0] == -2) {
                    msj = "Lista No Tiene Valores Asignados";
                    MensajeAlerta(1, msj)
                }

                if (m[0] == 0) {
                    $("#divEditarLista").html(m[1]);
                }
                return false;
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                ocultarCargador();
                var msj = "Respuesta = " + XMLHttpRequest.responseText + "\n Estatus = " + textStatus + "\n Error = " + errorThrown + "llenaComboCondiciones";
                MensajeAlerta(1, msj)
            }
        });
    }


}