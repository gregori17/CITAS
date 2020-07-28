<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Principal.Master" CodeBehind="frmRegistrarCliente.aspx.vb" Inherits="CITAS.frmRegistrarCliente" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <div class=" container mb-2">
        <div class="col-md-12">
            <!-- general form elements -->
            <div class="card card-dark mt-2">
                <div class="card-header">
                    <h3 class="card-title">Clientes</h3>
                </div>
                <!-- /.card-header -->
                <!-- form start -->
                <form role="form">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-12 col-sm-12 col-md-6 col-lg-6">
                                <div class="form-group">
                                    <label for="txtNombre">Nombre</label>
                                    <input type="text" class="form-control" id="txtNombre" placeholder="Ingrese Nombre">
                                </div>
                            </div>

                            <div class="col-12 col-sm-12 col-md-6 col-lg-6">
                                <div class="form-group">
                                    <label for="txtApellido">Apellido</label>
                                    <input type="text" class="form-control" id="txtApellido" placeholder="Ingrese Apellido">
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-12 col-sm-12 col-md-6 col-lg-6">
                                <div class="form-group">
                                    <label for="txtCalle">Calle</label>
                                    <input type="text" class="form-control" id="txtCalle" placeholder="Ingrese Calle">
                                </div>
                            </div>

                            <div class="col-12 col-sm-12 col-md-3 col-lg-3">
                                <div class="form-group">
                                    <label for="ddlCiudad">Ciudad</label>
                                    <select class="form-control" id="ddlCiudad"></select>
                                </div>
                            </div>

                            <div class="col-12 col-sm-12 col-md-3 col-lg-3">
                                <div class="form-group">
                                    <label for="ddlPais">Pais</label>
                                    <select class="form-control" id="ddlPais"></select>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-12 col-sm-12 col-md-3 col-lg-3">
                                <div class="form-group">
                                    <label for="txtTelefono">Telefono</label>
                                    <input type="text" class="form-control" id="txtTelefono" placeholder="Ingrese Telefono">
                                </div>
                            </div>

                            <div class="col-12 col-sm-12 col-md-3 col-lg-3">
                                <div class="form-group">
                                    <label for="txtCelular">Celular</label>
                                    <input type="text" class="form-control" id="txtCelular" placeholder="Ingrese Celular">
                                </div>
                            </div>

                            <div class="col-12 col-sm-12 col-md-6 col-lg-6">
                                <div class="form-group">
                                    <label for="txtApellido">Email</label>
                                    <input type="email" class="form-control" id="txtEmail" placeholder="Ingrese Email">
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-12 col-sm-12 col-md-6 col-lg-6">
                                <div class="form-group">
                                    <label for="txtIDIdendificacion">ID Idendificacion</label>
                                    <input type="text" class="form-control" id="txtIDIdendificacion" placeholder="Ingrese Nombre">
                                </div>
                            </div>
                        </div>

                    </div>
                    <!-- /.card-body -->

                    <div class="card-footer">
                        <button type="submit" class="btn btn-primary">Guardar</button>
                    </div>
                </form>
            </div>
            <!-- /.card -->
        </div>
    </div>
</asp:Content>
