<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Principal.Master" CodeBehind="frmArticulos.aspx.vb" Inherits="CITAS.frmArticulos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" runat="server">

        <div class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1 class="m-0 text-dark">Listado Articulos</h1>
                </div>
                <!-- /.col -->
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item">
                            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modal-lg">Nuevo Articulo</button></li>
                    </ol>
                </div>
                <!-- /.col -->
            </div>
            <!-- /.row -->
        </div>
        <!-- /.container-fluid -->
    </div>
    <div class=" container">
        <div class="col-md-12">
            <!-- general form elements -->
            <div class="card card-dark">
                <div class="card-header">
                    <h3 class="card-title">Articulos</h3>
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
                     <div class="row">
                            <div class="col-12 col-sm-12 col-md-6 col-lg-6">
                                <div class="form-group">
                                    <label for="txtNombre">Nombre</label>
                                    <input type="text" class="form-control" id="txtNombre" placeholder="Ingrese Nombre" data-GERA="_1G_R">
                                </div>
                            </div>

                            <div class="col-12 col-sm-12 col-md-6 col-lg-6">
                                <div class="form-group">
                                    <label for="txtApellido">Apellido</label>
                                    <input type="text" class="form-control" id="txtApellido" placeholder="Ingrese Apellido" data-GERA="_1G_R">
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-12 col-sm-12 col-md-6 col-lg-6">
                                <div class="form-group">
                                    <label for="txtCalle">Calle</label>
                                    <input type="text" class="form-control" id="txtCalle" placeholder="Ingrese Nombre" data-GERA="_1G">
                                </div>
                            </div>

                            <div class="col-12 col-sm-12 col-md-3 col-lg-3">
                                <div class="form-group">
                                    <label for="cbCiudad">Ciudad</label>
                                    <select class="form-control" id="cbCiudad"></select>
                                </div>
                            </div>

                            <div class="col-12 col-sm-12 col-md-3 col-lg-3">
                                <div class="form-group">
                                    <label for="txtPais">Pais</label>
                                    <input type="text" class="form-control" id="txtPais" placeholder="Ingrese Apellido" data-GERA="_1G">
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-12 col-sm-12 col-md-3 col-lg-3">
                                <div class="form-group">
                                    <label for="txtTelefono">Telefono</label>
                                    <input type="text" class="form-control" id="txtTelefono" placeholder="Ingrese Nombre" data-GERA="_1G">
                                </div>
                            </div>

                            <div class="col-12 col-sm-12 col-md-3 col-lg-3">
                                <div class="form-group">
                                    <label for="txtCelular">Celular</label>
                                    <input type="text" class="form-control" id="txtCelular" placeholder="Ingrese Apellido" data-GERA="_1G">
                                </div>
                            </div>

                            <div class="col-12 col-sm-12 col-md-6 col-lg-6">
                                <div class="form-group">
                                    <label for="txtApellido">Email</label>
                                    <input type="email" class="form-control" id="txtEmail" placeholder="Ingrese Apellido" data-GERA="_1G">
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-12 col-sm-12 col-md-6 col-lg-6">
                                <div class="form-group">
                                    <label for="dllTipoID">Tipo Idendificacion</label>
                                    <select class="form-control" id="cbTipoID" data-GERA="_1G"></select>
                                </div>
                            </div>
                            <div class="col-12 col-sm-12 col-md-6 col-lg-6">
                                <div class="form-group">
                                    <label for="txtIDIdendificacion">No. Idendificacion</label>
                                    <input type="text" class="form-control" id="txtIDIdendificacion" placeholder="Ingrese Nombre" data-GERA="_1G_R">
                                </div>
                            </div>
                        </div>

                </div>
                <div class="modal-footer justify-content-between">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                    <button type="button" class="btn btn-primary">Guardar</button>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>


</asp:Content>
