Imports System
Imports System.Web
Imports System.Web.Services
Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.Common

Public Class gera
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub




    <WebMethod()>
    Public Shared Function llenaComboWhere(ByVal idCampo As String, ByVal where As String) As ArrayList
        Dim retorna As String = String.Empty
        Dim sql As String = String.Empty
        Dim arrItems As New ArrayList

        If where = " " Then
            where = ""
        End If

        sql = " DECLARE @Query varchar(max);"
        sql &= " SELECT @Query = QueryCombo FROM Tab_Consulta_General"
        sql &= " WHERE CampoCombo = '" & idCampo & "';"
        sql &= " EXEC (@Query + '" & where & "')"


        Try
            Using conn As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("ConexionGERA").ConnectionString)
                If conn.State = ConnectionState.Closed Then
                    conn.Open()
                End If
                Using cmd As SqlCommand = New SqlCommand(sql.ToString(), conn)
                    Using dr As SqlDataReader = cmd.ExecuteReader()
                        If dr.HasRows Then
                            While dr.Read()
                                arrItems.Add(New ListItem(dr(1), dr(0)))
                            End While

                        End If
                    End Using
                End Using
            End Using

        Catch ex As Exception

        End Try

        Return arrItems

    End Function




    <WebMethod()>
    Public Shared Function CrearLista(ByVal ValoresLista As String, ByVal NombreLista As String) As String
        Dim retorna As String = String.Empty
        Dim sql As String = String.Empty
        Dim arrItems As New ArrayList

        'Try
        '    Using conn As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("ConexionGERA").ConnectionString)
        '        If conn.State = ConnectionState.Closed Then
        '            conn.Open()
        '        End If
        '        Using cmd As SqlCommand = New SqlCommand(sql.ToString(), conn)
        '            Using dr As SqlDataReader = cmd.ExecuteReader()
        '                If dr.HasRows Then
        '                    While dr.Read()
        '                        arrItems.Add(New ListItem(dr(1), dr(0)))
        '                    End While

        '                End If
        '            End Using
        '        End Using
        '    End Using

        'Catch ex As Exception

        'End Try
        retorna = "Listo"
        Return retorna

    End Function




    <WebMethod()>
    Public Shared Function CrearLista(ByVal modo As String, ByVal ValoresLista As String, ByVal NombreLista As String) As String
        Dim Retorna As String = String.Empty
        Dim sql As String = String.Empty
        Dim resto As String = String.Empty
        Dim arregloCampo() As String = ValoresLista.Split("|")
        Dim IDLista As String = String.Empty
        Try

            For r = 0 To arregloCampo.Length - 2


                'If modo = 1 Then
                '    sql = "UPDATE " & tabla & " SET " & sql & " usuarioSistema = '" & HttpContext.Current.Session("UID") & "', fechaSistema =  GETDATE()"
                '    resto = " WHERE idCompania = " & HttpContext.Current.Session("idCompania") & " AND " & resto.Substring(0, resto.Length - 5) & "; " & contador
                'End If

                Using oConn As New SqlConnection(ConfigurationManager.ConnectionStrings("ConexionGERA").ConnectionString)
                    If oConn.State = ConnectionState.Closed Then
                        oConn.Open()
                    End If
                    Dim Trans As SqlTransaction = oConn.BeginTransaction

                    If IDLista = "" Then
                        IDLista = CrearLista(oConn, Trans, NombreLista)
                    End If
                    sql = ""
                    resto = ""
                    Dim ValorLista() As String = arregloCampo(r).Split("=")

                    Dim Estatus As Integer = 0
                    If ValorLista(1) = "Activo" Then
                        Estatus = 1
                    Else
                        If ValorLista(1) = "Inactivo" Then
                            Estatus = 0
                        End If

                    End If
                    sql = "'" & ValorLista(0) & "'," & IDLista & ",GetDate()," & Estatus




                    Try
                        If modo = 0 Then
                            sql = " INSERT INTO  Tab_Lista_Valor (NombreValorLista, IDLista, FechaValorLista, Estatus) values ( " & sql & ")"
                            Using oCmd As New SqlCommand(sql, oConn, Trans)
                                oCmd.ExecuteScalar()
                                Retorna = "0|" & NombreLista
                            End Using
                            Trans.Commit()
                        End If
                    Catch ex As Exception
                        Trans.Rollback()
                        Retorna = "-1|" & ex.Message
                    End Try
                End Using
            Next
        Catch ex As Exception
            Retorna = "-1|" & ex.Message
        End Try

        Return Retorna
    End Function


    <WebMethod()>
    Public Shared Function EditarLista(ByVal modo As String, ByVal IDLista As String) As String
        Dim Retorna As String = String.Empty
        Dim sql As String = String.Empty
        Dim Tabla As String = String.Empty


        Try
            sql = BuscarConsulta("tabTab_Editar_LIsta", "")
            If sql = "" Then
                Retorna = "-1|"
            Else
                sql = sql & " where IDLista = '" & IDLista & "'"
                Tabla = CrearTablaHTML(sql)
            End If


            Select Case Tabla
                Case "-2|"
                    Retorna = "-2"
                Case "-1|"
                    Retorna = "-1"
                Case Else
                    Retorna = "<tfoot>"
                    Retorna &= "<tr>"
                    Retorna &= "<th>"
                    Retorna &= "<input type='text' class='form-control' id='txtValorListaEditar' placeholder='Ingrese Nombre'>"
                    Retorna &= "</th>"
                    Retorna &= "<th>"
                    Retorna &= "<select class='form-control' id='dllEstatusListaEditar'>"
                    Retorna &= "<option>Activo</option>"
                    Retorna &= "<option>Inactivo</Option>"
                    Retorna &= "</Select>"
                    Retorna &= "</th>"
                    Retorna &= "<th style='width: 40px'>"
                    Retorna &= "<span Class='badge bg-success'>"
                    Retorna &= "<button type='button' Class='btn' id='AgregarValorListaEditar'>"
                    Retorna &= "<i Class='fas fa-plus-circle'></i>"
                    Retorna &= "</button>"
                    Retorna &= "</span>"
                    Retorna &= "</th>"
                    Retorna &= "</tr>"
                    Retorna &= "</tfoot>"
                    Tabla = Tabla.Replace("</tbody>", "</tbody>" & Retorna)

                    Retorna = "<span class='badge bg-danger m-0'>"
                    Retorna &= "<a href='#'>"
                    Retorna &= "<i class='fas fa-minus-circle'>"
                    Retorna &= "</i>"
                    Retorna &= "</a>"
                    Retorna &= "</span>"
                    Retorna &= "<span class='badge bg-warning m-0'>"
                    Retorna &= "<a href='#'>"
                    Retorna &= "<i class='fas fa-pen'>"
                    Retorna &= "</i>"
                    Retorna &= "</a>"
                    Retorna &= "</span>"
                    Tabla = Tabla.Replace("BotonAccion", Retorna)

                    Tabla = Tabla.Replace("True", "Activo")
                    Tabla = Tabla.Replace("False", "Inactivo")
                    Retorna = "0|" & Tabla
            End Select


        Catch ex As Exception
            Retorna = "-1|" & ex.Message
        End Try

        Return Retorna
    End Function


    Public Shared Function CrearTablaHTML(ByVal SQL As String) As String
        Dim Retorna As String = String.Empty
        Dim resto As String = String.Empty
        Dim paso As Integer

        Try
            Using oConn As New SqlConnection(ConfigurationManager.ConnectionStrings("ConexionGERA").ConnectionString)
                If oConn.State = ConnectionState.Closed Then
                    oConn.Open()
                End If


                Using oCmd As New SqlCommand(SQL, oConn)
                    Using odr As SqlDataReader = oCmd.ExecuteReader
                        If odr.HasRows Then
                            Retorna = "<table id='tabTab_Editar_LIsta' class='table table-striped table-bordered' style='width:100%'><thead>"
                            Retorna &= "<tr>"
                            While odr.Read()
                                If paso = 0 Then
                                    For i = 0 To odr.FieldCount - 1
                                        Retorna &= "<th scope = 'col' >" & odr.GetName(i) & "</th>"
                                    Next
                                    paso = 1
                                    Retorna &= "</tr>"
                                    Retorna &= "</thead>"
                                    Retorna &= "<tbody>"
                                End If
                                Retorna &= "<tr>"
                                For i = 0 To odr.FieldCount - 1
                                    Retorna &= "<td>" & odr(i).ToString & "</td>"
                                Next
                                Retorna &= "</tr>"
                            End While
                            Retorna &= "</tr>"
                            Retorna &= "</tbody>"
                            Retorna &= "</table>"
                            Retorna &= "</table>"
                        End If

                        If odr.HasRows = "False" Then
                            Retorna = "-2|"
                        End If
                    End Using
                End Using


            End Using

        Catch ex As Exception
            Retorna = "-1|" & ex.Message
        End Try

        Return Retorna
    End Function

    Public Shared Function BuscarConsulta(ByVal idCampo As String, ByVal where As String) As String
        Dim retorna As String = String.Empty
        Dim sql As String = String.Empty

        If where = " " Then
            where = ""
        End If


       sql = " SELECT QueryCombo FROM Tab_Consulta_General"
        sql &= " WHERE CampoCombo = '" & idCampo & "';"



        Try
            Using conn As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("ConexionGERA").ConnectionString)
                If conn.State = ConnectionState.Closed Then
                    conn.Open()
                End If
                Using oCmd As New SqlCommand(sql, conn)
                    retorna = oCmd.ExecuteScalar
                End Using
            End Using

        Catch ex As Exception

        End Try
        Return retorna
    End Function


    Private Shared Function CrearLista(ByRef oConn As SqlConnection, ByRef Trans As SqlTransaction, ByVal NombreLista As String) As String
        Dim Sql As String = String.Empty
        Dim Retorna As String = String.Empty

        Sql &= "INSERT INTO Tab_Listas (NombreLista, FechaCreacion, Estatus)  "
        Sql &= " VALUES('" & NombreLista & "',GETDATE(),1) "
        Sql &= "SELECT SCOPE_IDENTITY(); "

        Using oCmd As New SqlCommand(Sql, oConn, Trans)
            Retorna = oCmd.ExecuteScalar
        End Using
        Return Retorna
    End Function

End Class