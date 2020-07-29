<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Principal.Master" CodeBehind="frmClientes.aspx.vb" Inherits="CITAS.frmClientes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    +
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" runat="server">

    <div class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-6 col-sm-6 col-md-6 col-lg-6">
                    <h1 class="m-0 text-dark">Listado Clientes</h1>
                </div>
                <div class="col-6 col-sm-6 col-md-6 col-lg-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item">
                            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modal-lg">Nuevo Cliente</button>
                       

                            </li>
                    </ol>
                </div>
                <!-- /.col -->
            </div>
            <!-- /.row -->
        </div>
        <!-- /.container-fluid -->
    </div>
    <div class=" ">
        <div class="col-md-12">
            <!-- general form elements -->
            <div class="card card-dark">
                <div class="card-header">
                    <h3 class="card-title">Clientes</h3>
                </div>

                <div class="card-body">
                    <div class="row">
                        <div class="col-12 col-sm-12 col-md-6 col-lg-6">
                        </div>

                    </div>

                </div>
                <!-- /.card-body -->
            </div>
            <!-- /.card -->
        </div>
    </div>


    <div class="modal fade" id="modal-lg">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">Nuevo Cliente</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <!-- Nav tabs -->
                    <ul class="nav nav-tabs nav-justified">
                        <li class="nav-item">
                            <a class="nav-link active" data-toggle="tab" href="#home">General</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" data-toggle="tab" href="#InformacionAdicional">Informacion Adicional</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" data-toggle="tab" href="#Estadistica">Estadistica</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" data-toggle="tab" href="#CamposAdicionales">Campos Adicionales</a>
                        </li>
                    </ul>
                    <br />

                    <!-- Tab panes -->
                    <div class="tab-content">
                        <div class="tab-pane container active" id="home">


                            <div class="row">
                                <div class="col-12 col-sm-12 col-md-6 col-lg-6">
                                    <div class="form-group">
                                        <label for="txtNombre">Nombre</label>
                                        <input type="text" class="form-control form-control-sm" id="txtNombre" placeholder="Ingrese Nombre" data-gera="_1G_R">
                                    </div>
                                </div>

                                <div class="col-12 col-sm-12 col-md-6 col-lg-6">
                                    <div class="form-group">
                                        <label for="txtApellido">Apellido</label>
                                        <input type="text" class="form-control form-control-sm" id="txtApellido" placeholder="Ingrese Apellido" data-gera="_1G_R">
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-12 col-sm-12 col-md-6 col-lg-6">
                                    <div class="form-group">
                                        <label for="txtCalle">Calle</label>
                                        <input type="text" class="form-control form-control-sm" id="txtCalle" placeholder="Ingrese Nombre" data-gera="_1G_R">
                                    </div>
                                </div>

                                <div class="col-12 col-sm-12 col-md-3 col-lg-3">
                                    <div class="form-group">
                                        <label for="ddlCiudad">Ciudad</label>
                                        <select class="form-control form-control-sm" id="ddlCiudad" data-gera="_1G_R_SI"></select>
                                    </div>
                                </div>

                                <div class="col-12 col-sm-12 col-md-3 col-lg-3">
                                    <div class="form-group">
                                        <label for="ddlPais">Pais</label>
                                        <select class="form-control form-control-sm" id="ddlPais" data-gera="_1G_R_SI"></select>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-12 col-sm-12 col-md-3 col-lg-3">
                                    <div class="form-group">
                                        <label for="txtTelefono">Telefono</label>
                                        <input type="text" class="form-control form-control-sm" id="txtTelefono" placeholder="Ingrese Nombre" data-gera="_1G_R">
                                    </div>
                                </div>

                                <div class="col-12 col-sm-12 col-md-3 col-lg-3">
                                    <div class="form-group">
                                        <label for="txtCelular">Celular</label>
                                        <input type="text" class="form-control form-control-sm" id="txtCelular" placeholder="Ingrese Apellido" data-gera="_1G_R">
                                    </div>
                                </div>

                                <div class="col-12 col-sm-12 col-md-6 col-lg-6">
                                    <div class="form-group">
                                        <label for="txtApellido">Email</label>
                                        <input type="email" class="form-control form-control-sm" id="txtEmail" placeholder="Ingrese Apellido" data-gera="_1G_R">
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-12 col-sm-12 col-md-6 col-lg-6">
                                    <div class="form-group">
                                        <label for="cbTipoID">Tipo Idendificacion</label>
                                        <select class="form-control form-control-sm" id="cbTipoID" data-gera="_1G_R"></select>
                                    </div>
                                </div>
                                <div class="col-12 col-sm-12 col-md-6 col-lg-6">
                                    <div class="form-group">
                                        <label for="txtIDIdendificacion">No. Idendificacion</label>
                                        <input type="text" class="form-control form-control-sm" id="txtIDIdendificacion" placeholder="Ingrese Nombre" data-gera="_1G_R">
                                    </div>
                                </div>
                            </div>


                        </div>
                        <div class="tab-pane container fade" id="InformacionAdicional">
                            <div class="row">
                                <div class="col-12 col-sm-12 col-md-3 col-lg-3">
                                    <div class="form-group">
                                        <img src="Imagenes/default-profile.png" class="img-thumbnail" alt="Imgen Cliente" width="150" height="150">
                                    </div>
                                </div>

                                <div class="col-12 col-sm-12 col-md-9 col-lg-9">
                                    <div class="form-group">
                                        <label for="txtComentario">Comentario</label>
                                        <textarea class="form-control form-control-sm" id="txtComentario" placeholder="Ingrese Apellido" data-gera="_1G_R"></textarea>
                                    </div>
                                </div>
                            </div>





                            
                        </div>
                        <div class="tab-pane container fade" id="Estadistica">...</div>
                        <div class="tab-pane container fade" id="CamposAdicionales">...</div>
                    </div>




                </div>
                <div class="modal-footer justify-content-between">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                    <button type="button" class="btn btn-primary" id="CrearListaDDL">Guardar</button>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>


</asp:Content>
