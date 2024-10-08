
Partial Class ventaWEB_webVentaTalonDEF
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If IsPostBack Then
        Else
            otxtCorreoElectronico.Text = Request.QueryString("email")
            otxtCelularNumero.Text = Request.QueryString("first_name")
            olblIdSorteo.Text = 1
            olblSession.Text = Session.SessionID
            olblIdContactoTipo.Text = 9
            celularNumeroControl()

            talonVendedorToma()
            olblIdSorteoTalonCobranza.Text = "0"
            sorteoInformacionGeneral()

        End If
        
      
    End Sub
    Private Sub celularNumeroControl()
        Dim Settings As ConnectionStringSettings
        Dim reader As System.Data.SqlClient.SqlDataReader
        Dim errorMessages As New StringBuilder()
        Dim retorno As Integer
        olblMensajeGrabacionCobranza.Text = ""
        Dim cmd As New System.Data.SqlClient.SqlCommand
        Settings = System.Configuration.ConfigurationManager.ConnectionStrings("STRSYSTEM")
        Dim connectionString As String = Settings.ConnectionString
        retorno = 0
        Using connection As New System.Data.SqlClient.SqlConnection(connectionString)
            With cmd
                .Connection = connection
                .CommandType = Data.CommandType.StoredProcedure
                .CommandText = "ventaWEBVerificaCelular"

                .Parameters.Clear()
            End With
            Try
                connection.Open()

                cmd.Parameters.Add("@celularNumero", Data.SqlDbType.Text).SqlValue = otxtCelularNumero.Text
                reader = cmd.ExecuteReader

                If reader.HasRows Then
                    While reader.Read
                        olblCelularNumeroValidado.Text = reader.Item("existe").ToString
                        otxtClienteApyNom.Text = reader("apynom").ToString
                        olblGestionDescripcion.Text = reader("apynom").ToString

                    End While
                End If
            Catch ex As Exception
                olblCelularNumeroMensaje.Text = ex.Message
            End Try
            connection.Close()
        End Using

      
        If LTrim(RTrim(olblCelularNumeroValidado.Text)) = "1" Then
            ' celular validado
            olblCelularNumeroMensaje.Text = "Celular validado"
            olblCelularNumeroValidado.Visible = False
            olblCelularNumeroValidadoMensaje.Text = ""
            PanelNumeros.Enabled = True
            obutValidacionVerifica.Visible = False
            oimgCelularVerifica.Visible = False

        Else
            obutValidacionVerifica.Visible = True
            olblCelularNumeroValidado.Visible = False
            ' celular invalido 
            oimgCelularVerifica.Visible = True

            PanelNumeros.Enabled = False
            olblCelularNumeroValidadoMensaje.Text = "Número de celular no validado"
            olblCelularNumeroMensaje.Text = "Envía un WHATSAPP con solo tu APELLIDO Y NOMBRE al +54 9 3704 77-9106  . Luego, toca el boton VERIFICAR."
        End If
    End Sub
    Protected Sub obutNumeros_Click(sender As Object, e As EventArgs) Handles obutNumeros.Click
        ' toma los talones seleccionados y presenta los números para colocar el premio y determinar el importe
       


        talonVendedorToma()
      
        talonVendedorAsientaPremio()

        PanelNumeros.Visible = True


        PanelPremio.Visible = True

    End Sub



    Public Sub talonVendedorToma()

        ' Validación de valores recibidos contra monto a cancelar.

        Dim Settings As ConnectionStringSettings
        Dim reader As System.Data.SqlClient.SqlDataReader
        Dim errorMessages As New StringBuilder()

        Dim cmd As New System.Data.SqlClient.SqlCommand
        Settings = System.Configuration.ConfigurationManager.ConnectionStrings("STRSYSTEM")
        Dim connectionString As String = Settings.ConnectionString

        Dim Row As GridViewRow

        Dim idSorteoTalon As Label
        Dim sorteoTalonTomado As CheckBox


        Dim fila As Integer

        olblValidacionMensajeError.Text = ""
        olblBilletesSeleccionadosCantidad.Text = "0"

        fila = 1
        Using connection As New System.Data.SqlClient.SqlConnection(connectionString)
            With cmd
                .Connection = connection
                .CommandType = Data.CommandType.StoredProcedure
                .CommandText = "sorteoTalonVendedorActualizaWEB"
            End With


            For Each Row In ogvSorteoTalonVendedorVenta.Rows
                Try
                    cmd.Parameters.Clear()

                    'olblValidacionMensaje.Text = LTrim(RTrim(olblValidacionMensaje.Text)) + "Por recuperar variables de grilla."
                    idSorteoTalon = CType(Row.FindControl("olblIdSorteoTalon"), Label)
                    sorteoTalonTomado = CType(Row.FindControl("ochSorteoTalonTomado"), CheckBox)
                    If sorteoTalonTomado.Checked = True Then
                        olblBilletesSeleccionadosCantidad.Text = (Val(olblBilletesSeleccionadosCantidad.Text) + 1).ToString

                    End If


                    connection.Open()
                    cmd.Parameters.Add("@idSorteoTalon", Data.SqlDbType.Int).SqlValue = idSorteoTalon.Text
                    cmd.Parameters.Add("@idOperador", Data.SqlDbType.Int).SqlValue = idOperador.Text
                    cmd.Parameters.Add("@sorteoTalonTomado", Data.SqlDbType.Int).SqlValue = sorteoTalonTomado.Checked
                    cmd.Parameters.Add("@sorteoTalonSession", Data.SqlDbType.Char).SqlValue = olblSession.Text


                    




                    reader = cmd.ExecuteReader()
                    If reader.HasRows Then
                        While reader.Read
                            olblGestionCodigo.text = reader.Item("gestionCodigo")
                            olblGestionDescripcion.Text = reader.Item("gestionDescripcion")
                            olblPar02.Text = reader.Item("sessionesConcurrentes").ToString + " persona(s) comprando"
                            If RTrim(LTrim(olblGestionCodigo.Text)) = "0" Then

                                If sorteoTalonTomado.Checked = True Then
                                    olblValidacionMensajeError.Text = LTrim(RTrim(olblValidacionMensajeError.Text)) + " - " + reader.Item("gestionDescripcion").ToString

                                End If

                            End If



                        End While
                    End If

                Catch ex As Exception
                    olblValidacionMensajeError.Text = LTrim(RTrim(olblValidacionMensajeError.Text)) + " Error: " + ex.ToString

                End Try
                connection.Close()


                fila = fila + 1

            Next
        End Using
        If olblBilletesSeleccionadosCantidad.Text = "1" Then
            olblBilletesSeleccionados.Text = " billete seleccionado"
        Else
            olblBilletesSeleccionados.Text = " billetes seleccionados"
        End If


        If Val(olblBilletesSeleccionadosCantidad.Text) > 0 Then
            obutPremios.Enabled = True
            obutPremios.BackColor = Drawing.Color.Yellow
            obutPremios.ForeColor = Drawing.Color.Black


        Else
            obutPremios.Enabled = True
            obutPremios.BackColor = Drawing.Color.Gray
            obutPremios.ForeColor  = Drawing.Color.White

        End If
        ogvSorteoTalonVendedorVenta.DataBind()

        ogvSorteoVendedorTalonSeleccionado .DataBind()
        talonVendedorAsientaPremio()




    End Sub

 


    Protected Sub DropDownList1_SelectedIndexChanged(sender As Object, e As EventArgs)
        talonVendedorAsientaPremio()
    End Sub

    Private Sub talonVendedorAsientaPremio()

        ' Validación de valores recibidos contra monto a cancelar.

        Dim Settings As ConnectionStringSettings
        Dim reader As System.Data.SqlClient.SqlDataReader
        Dim errorMessages As New StringBuilder()

        Dim cmd As New System.Data.SqlClient.SqlCommand
        Settings = System.Configuration.ConfigurationManager.ConnectionStrings("STRSYSTEM")
        Dim connectionString As String = Settings.ConnectionString

        Dim Row As GridViewRow

        Dim idSorteoTalon As Label
        Dim idSorteoPremio As DropDownList


        Dim fila As Integer

        olblValidacionMensajeErrorPremio.Text = ""
        olblValidacionMensajeErrores.Text = "0"

        fila = 1
        Using connection As New System.Data.SqlClient.SqlConnection(connectionString)
            With cmd
                .Connection = connection
                .CommandType = Data.CommandType.StoredProcedure
                .CommandText = "sorteoTalonVendedorAsientaPremio"
            End With
            olblMontoTotal.Text = "0"
            olblCantidadTotal.Text = "0"
            For Each Row In ogvSorteoVendedorTalonSeleccionado.Rows
                Try
                    cmd.Parameters.Clear()

                    'olblValidacionMensaje.Text = LTrim(RTrim(olblValidacionMensaje.Text)) + "Por recuperar variables de grilla."
                    idSorteoTalon = CType(Row.FindControl("olblIdSorteoTalon"), Label)
                    idSorteoPremio = CType(Row.FindControl("oddlPremio"), DropDownList)

                    connection.Open()
                    cmd.Parameters.Add("@idSorteoTalon", Data.SqlDbType.Int).SqlValue = idSorteoTalon.Text
                    cmd.Parameters.Add("@idSorteoPremio", Data.SqlDbType.Int).SqlValue = idSorteoPremio.SelectedValue


                    reader = cmd.ExecuteReader()

                    If reader.HasRows Then
                        While reader.Read
                            olblMontoTotal.Text = (Val(olblMontoTotal.Text) + reader.Item("sorteoPremioCosto"))
                            If reader.Item("sorteoPremioCosto") > 0 Then
                                olblCantidadTotal.Text = (Val(olblCantidadTotal.Text) + 1).ToString
                            Else
                                olblValidacionMensajeErrores.Text = (Val(olblValidacionMensajeErrores.Text) + 1).ToString
                                olblValidacionMensajeErrorPremio.Text = "Debe completar el talón con el premio en cada billete seleccionado."
                            End If

                        End While
                    End If
                Catch ex As Exception
                    olblValidacionMensajeErrorPremio.Text = LTrim(RTrim(olblValidacionMensajeErrorPremio.Text)) + " Error: " + ex.ToString

                End Try
                connection.Close()


                fila = fila + 1

            Next
        End Using

        olblPagoConfirmadoMonto.Text = olblMontoTotal.Text

        ogvSorteoVendedorTalonSeleccionado.DataBind()

        If olblValidacionMensajeErrores.Text = "0" And Val(olblCantidadTotal.Text) > 0 Then
            PanelValores.Visible = True
            otxtLeyendaPago.Visible = True
            obutRealizarPago.Visible = True

        Else
            PanelValores.Visible = True
            otxtLeyendaPago.Visible = True
            obutRealizarPago.Visible = True

        End If



    End Sub



    Protected Sub sorteoOperadorDatosInicio()
        Dim Settings As ConnectionStringSettings
        Dim reader As System.Data.SqlClient.SqlDataReader
        Dim errorMessages As New StringBuilder()
        Dim retorno As Integer
        olblMensajeGrabacionCobranza.Text = ""
        Dim cmd As New System.Data.SqlClient.SqlCommand
        Settings = System.Configuration.ConfigurationManager.ConnectionStrings("STRSYSTEM")
        Dim connectionString As String = Settings.ConnectionString
        retorno = 0
        Using connection As New System.Data.SqlClient.SqlConnection(connectionString)
            With cmd
                .Connection = connection
                .CommandType = Data.CommandType.StoredProcedure
                .CommandText = "sorteoOperadorDatosInicio"

                .Parameters.Clear()
            End With
            Try
                connection.Open()

                cmd.Parameters.Add("@idOperador", Data.SqlDbType.Int).SqlValue = olblIdOperador.Text




                reader = cmd.ExecuteReader

                If reader.HasRows Then
                    While reader.Read
                        'olblTalonesAsignados.Text = reader.Item("talonesAsignados")
                        'olblTalonesVendidos.Text = reader.Item("talonesVenddos")
                        'olblTotalRecaudado.Text = reader.Item("totalRecaudado")
                        'olblTalonesPendientes.Text = reader.Item("talonesPendientes")
                        'olblCotizacionDolarVenta.Text = reader.Item("cotizacionDolarVenta")
                    End While
                End If
            Catch ex As Exception
                olblMensajeGrabacionCobranza.Text = ex.Message
            End Try
            connection.Close()
        End Using
    End Sub



    Private Sub sorteoTalonCobranzaAM()

        Dim Settings As ConnectionStringSettings
        Dim reader As System.Data.SqlClient.SqlDataReader
        Dim errorMessages As New StringBuilder()
        Dim retorno As Integer
        olblMensajeGrabacionCobranza.Text = ""
        Dim cmd As New System.Data.SqlClient.SqlCommand
        Settings = System.Configuration.ConfigurationManager.ConnectionStrings("STRSYSTEM")
        Dim connectionString As String = Settings.ConnectionString
        retorno = 0
        Using connection As New System.Data.SqlClient.SqlConnection(connectionString)
            With cmd
                .Connection = connection
                .CommandType = Data.CommandType.StoredProcedure
                .CommandText = "sorteoTalonCobranzaAM"

                .Parameters.Clear()
            End With
            Try
                connection.Open()

                cmd.Parameters.Add("@idSorteoTalonCobranza", Data.SqlDbType.Int).SqlValue = olblIdSorteoTalonCobranza.Text
                cmd.Parameters.Add("@idOperador", Data.SqlDbType.Int).SqlValue = olblIdOperador.Text
                cmd.Parameters.Add("@efectivoMonto", Data.SqlDbType.Money).SqlValue = 0
                cmd.Parameters.Add("@transferenciaMonto", Data.SqlDbType.Money).SqlValue = Val(olblMontoTotal.Text)
                cmd.Parameters.Add("@transferenciaNumero", Data.SqlDbType.Text).SqlValue = ""
                cmd.Parameters.Add("@transferenciaImagen", Data.SqlDbType.Text).SqlValue = ""



                reader = cmd.ExecuteReader

                If reader.HasRows Then
                    While reader.Read
                        olblIdSorteoTalonCobranza.Text = reader.Item("idSorteoTalonCobranza").ToString
                    End While
                End If
            Catch ex As Exception
                olblMensajeGrabacionCobranza.Text = ex.Message + "(  idTalon: " + olblIdSorteoTalonCobranza.Text + "  idOperador" + olblIdOperador.Text


            End Try
            connection.Close()
        End Using

    End Sub

    Protected Sub obutConfirmaOperacion_Click(sender As Object, e As EventArgs) Handles obutConfirmaOperacion.Click
        PanelEncuesta.Visible = True


        Dim habilita As Integer
        habilita = 1


        Dim correoValidado As Integer
        correoValidado = 1

        Dim telefonoValidado As Integer
        telefonoValidado = 1


        olblMensajeValidacion.Text = ""

            If olblIdSorteoTalonCobranza.Text = "0" Then
                olblMensajeValidacion.Text = LTrim(RTrim(olblMensajeValidacion.Text)) + "- Debe completar operacion  -"
                habilita = 0

            End If

            If Len(LTrim(RTrim(otxtClienteApyNom.Text))) = 0 Then
                olblMensajeValidacion.Text = LTrim(RTrim(olblMensajeValidacion.Text)) + "- Debe completar apellido y nombres del cliente -"
                habilita = 0

            End If
            
           
        'If habilita = 1 And olblIdSorteoTalonCobranza.Text <> "0" Then
        ventaConfirmada()

        ' End If

    End Sub
    Protected Sub ventaConfirmada()
        talonVendedorAsientaCliente()
        'grabo por si hubo algùn cambio en forma de pago 
        sorteoTalonCobranzaAM()
        'Graba encuesta
        encuestaGraba()

        'inicializaVariables()

    End Sub




    Private Sub talonVendedorAsientaCliente()

        ' Validación de valores recibidos contra monto a cancelar.

        Dim Settings As ConnectionStringSettings
        Dim reader As System.Data.SqlClient.SqlDataReader
        Dim errorMessages As New StringBuilder()

        Dim cmd As New System.Data.SqlClient.SqlCommand
        Settings = System.Configuration.ConfigurationManager.ConnectionStrings("STRSYSTEM")
        Dim connectionString As String = Settings.ConnectionString

        Dim Row As GridViewRow

        Dim idSorteoTalon As Label

        Dim fila As Integer

        olblValidacionMensajeErrorPremio.Text = ""
        olblValidacionMensajeErrores.Text = "0"

        fila = 1
        Using connection As New System.Data.SqlClient.SqlConnection(connectionString)
            With cmd
                .Connection = connection
                .CommandType = Data.CommandType.StoredProcedure
                .CommandText = "sorteoTalonVendedorAsientaCliente"
            End With
            olblMontoTotal.Text = "0"
            olblCantidadTotal.Text = "0"
            For Each Row In ogvSorteoVendedorTalonSeleccionado.Rows
                Try
                    cmd.Parameters.Clear()

                    'olblValidacionMensaje.Text = LTrim(RTrim(olblValidacionMensaje.Text)) + "Por recuperar variables de grilla."
                    idSorteoTalon = CType(Row.FindControl("olblIdSorteoTalon"), Label)

                    connection.Open()
                    cmd.Parameters.Add("@idSorteoTalon", Data.SqlDbType.Int).SqlValue = idSorteoTalon.Text
                    cmd.Parameters.Add("@idSorteoTalonCobranza", Data.SqlDbType.Int).SqlValue = olblIdSorteoTalonCobranza.Text
                    cmd.Parameters.Add("@clienteApynom", Data.SqlDbType.Text).SqlValue = otxtClienteApyNom.Text
                    cmd.Parameters.Add("@clienteTelefono", Data.SqlDbType.Text).SqlValue = ""
                    cmd.Parameters.Add("@clienteCorreoElectronico", Data.SqlDbType.Text).SqlValue = ""

                    reader = cmd.ExecuteReader()

                    If reader.HasRows Then
                        While reader.Read

                        End While
                    End If
                Catch ex As Exception
                    olblValidacionMensajeErrorPremio.Text = LTrim(RTrim(olblValidacionMensajeErrorPremio.Text)) + " Error: " + ex.ToString

                End Try
                connection.Close()


                fila = fila + 1

            Next
        End Using


        ogvSorteoVendedorTalonSeleccionado.DataBind()

        If olblValidacionMensajeErrores.Text = "0" Then
            PanelValores.Visible = True
        Else
            PanelValores.Visible = True

        End If



    End Sub



    Private Sub inicializaVariables()

        orbEncuesta_inversion.SelectedValue = "0"
        orbEncuesta_esPropietario.SelectedValue = "0"
        orbEncuesta_alquila.SelectedValue = "0"
        orbEncuesta_enQueInvertiria.SelectedValue = "0"
        orbEncuesta_esClienteMPC.SelectedValue = "0"
        ogvSorteoVendedorTalonSeleccionado.DataBind()

        ogvSorteoTalonVendedorVenta.DataBind()
        otxtClienteApyNom.Text = ""
        'otxtClienteTelefono.Text = ""
        'otxtClienteCorreoElectronico.Text = ""
        obutConfirmaOperacion.Visible = False
        obutOperacionRealizada.Visible = True
        olblOperacionRealizada.Text = "Venta asentada según número interno " + Right("00000000" + LTrim(RTrim(olblIdSorteoTalonCobranza.Text)).ToString, 8)
        Session.Item("idSorteoTalonCobranza") = 0


    End Sub


    Private Sub nuevaVenta()
        Response.Redirect("webVentaTalon.aspx")
    End Sub



    Private Sub encuestaGraba()
        Dim Settings As ConnectionStringSettings
        Dim reader As System.Data.SqlClient.SqlDataReader
        Dim errorMessages As New StringBuilder()
        Dim retorno As Integer
        olblMensajeGrabacionCobranza.Text = ""
        Dim cmd As New System.Data.SqlClient.SqlCommand
        Settings = System.Configuration.ConfigurationManager.ConnectionStrings("STRSYSTEM")
        Dim connectionString As String = Settings.ConnectionString
        retorno = 0
        Using connection As New System.Data.SqlClient.SqlConnection(connectionString)
            With cmd
                .Connection = connection
                .CommandType = Data.CommandType.StoredProcedure
                .CommandText = "sorteoTalonCobranzaEncuestaGraba"

                .Parameters.Clear()
            End With
            Try
                connection.Open()

                cmd.Parameters.Add("@idSorteoTalonCobranza", Data.SqlDbType.Int).SqlValue = olblIdSorteoTalonCobranza.Text
                cmd.Parameters.Add("@encuesta_inversion", Data.SqlDbType.Int).SqlValue = orbEncuesta_inversion.SelectedValue
                cmd.Parameters.Add("@encuesta_esPropietario", Data.SqlDbType.Int).SqlValue = orbEncuesta_esPropietario.SelectedValue
                cmd.Parameters.Add("@encuesta_alquila", Data.SqlDbType.Int).SqlValue = orbEncuesta_alquila.SelectedValue
                cmd.Parameters.Add("@encuesta_esClienteMPC", Data.SqlDbType.Int).SqlValue = orbEncuesta_esClienteMPC.SelectedValue
                cmd.Parameters.Add("@encuesta_enQueInvertiria", Data.SqlDbType.Int).SqlValue = orbEncuesta_enQueInvertiria.SelectedValue



                reader = cmd.ExecuteReader

                If reader.HasRows Then
                    While reader.Read
                        olblIdSorteoTalonCobranza.Text = reader.Item("idSorteoTalonCobranza").text

                    End While
                End If
            Catch ex As Exception
                olblMensajeGrabacionCobranza.Text = ex.Message
            End Try
            connection.Close()
        End Using
    End Sub

    Protected Sub obutOperacionRealizada_Click(sender As Object, e As EventArgs) Handles obutOperacionRealizada.Click
        nuevaVenta()

    End Sub

     

    Protected Sub obutPremios_Click(sender As Object, e As EventArgs) Handles obutPremios.Click
        PanelNumeros.Visible = True
        PanelPremio.Visible = True
        ogvSorteoVendedorTalonSeleccionado.DataBind()
        talonVendedorAsientaPremio()
    End Sub


    Protected Sub sorteoInformacionGeneral()
        Dim Settings As ConnectionStringSettings
        Dim reader As System.Data.SqlClient.SqlDataReader
        Dim errorMessages As New StringBuilder()
        Dim retorno As Integer
        olblMensajeGrabacionCobranza.Text = ""
        Dim cmd As New System.Data.SqlClient.SqlCommand
        Settings = System.Configuration.ConfigurationManager.ConnectionStrings("STRSYSTEM")
        Dim connectionString As String = Settings.ConnectionString
        retorno = 0
        Using connection As New System.Data.SqlClient.SqlConnection(connectionString)
            With cmd
                .Connection = connection
                .CommandType = Data.CommandType.StoredProcedure
                .CommandText = "sorteoInformacionGeneralID"

                .Parameters.Clear()
            End With
            Try
                connection.Open()

                cmd.Parameters.Add("@operadorID", Data.SqlDbType.Text).SqlValue = Request.QueryString("Operador")
                

                reader = cmd.ExecuteReader

                If reader.HasRows Then
                    While reader.Read
                        olblInformacionVenta.Text = reader.Item("InformacionVenta").ToString
                        olblIdOperador.Text = reader.Item("idOperador")
                        idOperador.Text = reader.Item("idOperador")



                    End While
                End If
            Catch ex As Exception
                olblInformacionVenta.Text = ex.Message
            End Try
            connection.Close()

            If idOperador.Text = "0" Then
                PanelAlta.Visible = False

            End If
        End Using
    End Sub

    Protected Sub obutRealizarPago_Click(sender As Object, e As EventArgs) Handles obutRealizarPago.Click
        sorteoTalonCobranzaAM()

        'PanelMercadoPAgo.Visible = False
        PanelTransferencia.Visible = False
        PanelNumeros.Visible = False
        PanelPremio.Visible = True
        PanelPremio.Enabled = False

        PanelValores.Visible = False
        PanelTransferencia.Visible = True


        'obutNumeros.Enabled = False
        'obutPremios.Enabled = False
        'obutCobrar.Enabled = True
        obutNumeros.BackColor = Drawing.Color.Gray
        obutPremios.BackColor = Drawing.Color.Gray
        obutPremios.ForeColor = Drawing.Color.White

        obutCobrar.BackColor = Drawing.Color.Orange
        obutCobrar.ForeColor = Drawing.Color.White


        olblPagoConfirmadoMonto.Text = "$" + olblMontoTotal.Text

        olblPagoConfirmadoMonto.Font.Size = 40


        PanelConfirmaOperacion.Visible = True

    End Sub

   
    Protected Sub obutValidacionVerifica_Click(sender As Object, e As EventArgs) Handles obutValidacionVerifica.Click
        celularNumeroControl()

    End Sub

    Protected Sub obutRango01_Click(sender As Object, e As EventArgs) Handles obutRango01.Click
        otxtCantidad.Text = "10"
        ogvSorteoTalonVendedorVenta.DataBind()

    End Sub

    Protected Sub obutRango02_Click(sender As Object, e As EventArgs) Handles obutRango02.Click
        otxtCantidad.Text = "30"
        ogvSorteoTalonVendedorVenta.DataBind()

    End Sub
End Class
