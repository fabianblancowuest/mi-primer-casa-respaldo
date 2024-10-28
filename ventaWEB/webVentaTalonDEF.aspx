﻿<%@ Page Language="VB" AutoEventWireup="false" MaintainScrollPositionOnPostback="true"
    CodeFile="webVentaTalonDEF.aspx.vb" Inherits="ventaWEB_webVentaTalonDEF" ContentType="text/html; charset=UTF-8" %>

    <%--<%@ Register Src="~/Administracion/whatsappValidador.ascx" TagPrefix="uc1" TagName="whatsappValidador" %>
        <%@ Register Src="~/Administracion/correoElectronicoValidador.ascx" TagPrefix="uc1"
            TagName="correoElectronicoValidador" %>
            --%>
            <!DOCTYPE html>

            <html>

            <head runat="server">
                <%-- Título --%>
                    <title>Mi Primer Casa S.A. - Venta Billetes - Sorteo</title>
                    <%-- Metadatos --%>
                        <meta charset="UTF-8" />
                        <meta lang="es" />
                        <meta name="viewport"
                            content="width=device-width, initial-scale=1, maximum-scale=2, user-scalable=no" />
                        <%-- <meta http-equiv="refresh" content="5" />--%>
                        <style type="text/css">
                            .btn-success {
                                margin-top: 0px;
                            }
                        </style>
                        <%-- Google Fonts --%>
                            <link rel="preconnect" href="https://fonts.googleapis.com" />
                            <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin="0" />
                            <link href="https://fonts.googleapis.com/css2?family=Quicksand:wght@300..700&display=swap"
                                rel="stylesheet" />
                            <link
                                href="https://fonts.googleapis.com/css2?family=Lato:ital,wght@0,100;0,300;0,400;0,700;0,900;1,100;1,300;1,400;1,700;1,900&family=Lobster&family=Playfair+Display:ital,wght@0,400..900;1,400..900&family=Roboto+Slab:wght@100..900&display=swap"
                                rel="stylesheet" />
                            <%-- Bootstrap Icons --%>
                                <link rel="stylesheet"
                                    href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" />
                                <%-- Styles Sheets --%>
                                    <link href="../ventaWEB/styles-mi-primer-casa.css" rel="stylesheet" />
                                    <%-- Favicon --%>
                                        <link rel="shortcut icon" href="images/logos/favicon.png" type="image/x-icon" />
                                        <%-- Scripts --%>
                                            <script type="text/javascript">
                                                function OpenWindows(url) {
                                                    window.open(url, " Título", "directories=no, location=no, menubar=no, scrollbars=yes, statusbar=no, tittlebar=no");
                                                }
                                            </script>
                                            <%-- Biblioteca Crypto --%>
                                                <script
                                                    src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/4.1.1/crypto-js.min.js"></script>
            </head>

            <body>
                <form id="form1" runat="server">
                    <asp:ScriptManager ID="ScriptManager1" runat="server" />
                    <%-- <asp:UpdatePanel runat="server" ID="UpdatePanel" style="background-color: whitesmoke">

                        <ContentTemplate>
                            --%>
                            <header class="header">
                                <img class="logo" src="images/logos/logo-def.jpeg" alt="mi-primer-casa-logo" />
                                <h1 id="Label12-">Mi Primer Casa S.A.</h1>
                                <h2 id="Label1" class="subtitulo">Una forma diferente de comprar</h2>
                            </header>

                            <%-- ID de la Sesión --%>
                                <asp:Label ID="olblSession" runat="server" Text="" Visible="true" CssClass="">
                                </asp:Label>
                                <br />
                                <%-- ID nombre de usuario vendedor --%>
                                    <asp:Label ID="olblVendedorReferenciaNombre" runat="server" Text="" Visible="true">
                                    </asp:Label>
                                    <br />
                                    <%-- ID celular usuario vendedor --%>
                                        <asp:Label ID="olblVendedorReferenciaCelular" runat="server" Text=""
                                            Visible="true"></asp:Label>
                                        <br />
                                        <asp:Label ID="olblSorteoWEBSessionMensaje" runat="server" Text=""
                                            Visible="true"></asp:Label>
                                        <asp:Label ID="olblIdOperador" runat="server" Text="" Visible="false">
                                        </asp:Label>
                                        <asp:Label ID="idOperador" runat="server" Text="" Visible="false"></asp:Label>
                                        <asp:Label ID="olblIdSorteo" runat="server" Text="" Visible="false"></asp:Label>
                                        <asp:Label ID="olblIdContactoTipo" runat="server" Text="" Visible="false">
                                        </asp:Label>
                                        <asp:Label ID="olblOperador" runat="server" Text="" Visible="false"></asp:Label>

                                        <div class="info-header">

                                            <asp:TextBox ID="olblInformacionVenta" runat="server" TextMode="MultiLine"
                                                Enabled="false"></asp:TextBox>
                                            <%-- <asp:Label ID="olblInformacionVenta" runat="server" Text=""
                                                Font-Bold="true" Font-Size="Medium"></asp:Label>--%>
                                        </div>
                                        <div class="msj-personas-comprando">
                                            <asp:Label ID="olblPar02" runat="server" Text="" Visible="false">
                                            </asp:Label>
                                        </div>

                                        <%-- Panel Cliente --%>
                                            <asp:Panel ID="PanelCliente" runat="server" Visible="true">
                                                <div class="formulario-cliente">

                                                    <asp:Label ID="olblTransaccionNumero" runat="server"
                                                        Text="Transaccion Numero:" Visible="false"></asp:Label>
                                                    <asp:Label ID="olblIdSorteoTalonCobranza" runat="server" Text=""
                                                        Visible="false"></asp:Label>


                                                    <div id="transaccion-cliente" class="transaccion-cliente">

                                                        <%-- <asp:TextBox ID="Label14" runat="server"
                                                            Text="Complete sus datos para que podamos enviarle sus comprobantes a su correo electrónico y Whatsapp."
                                                            TextMode="MultiLine" Enabled="false" BorderWidth="0">
                                                            </asp:TextBox>--%>
                                                            <p id="msj-inicial">
                                                                Completá tus datos para que podamos enviarte tus
                                                                comprobantes a tu correo electrónico y Whatsapp.

                                                            </p>
                                                            <p id="msj-inicial-validado" class="oculto">
                                                                Seleccioná tus números y participá por los tres grandes
                                                                PREMIOS de fin de año. También tendrás la chance de
                                                                GANAR $100.000 cada semana que se sortearán en el
                                                                programa "Desde el Litoral" por Canal 11. ¡Aprovechá
                                                                esta GRAN OPORTUNIDAD, es tu momento de GANAR!
                                                            </p>

                                                    </div>

                                                    <%-- Modal Bases y Condiciones --%>
                                                        <div id="basesYCondiciones" class="modal modal-bases">
                                                            <article class="modal-content bases-y-condiciones">
                                                                <h2 class="text-center">BASES Y CONDICIONES</h2>
                                                                <ol>
                                                                    <li>Participan las personas mayores de 18 años, sin
                                                                        obligación de compra, excepto los empleados de
                                                                        MPC(Mi Primer Casa S.A.) El Cupón (numero) tiene
                                                                        un valor equivalente a US$ 1, US$ 4 y US$ 6.
                                                                    </li>
                                                                    <li>El participante llevará como constancia de su
                                                                        participación un billete publicitario con la
                                                                        base del presente concurso.
                                                                    </li>
                                                                    <li>Para participar deberá completar sus datos y una
                                                                        breve encuesta.
                                                                    </li>
                                                                    <li>PREMIO MENOR: Se sorteará por semana
                                                                        $100.000(pesos Argentinos) en el programa "Desde
                                                                        el Litoral" que se emite por el canal 11 todos
                                                                        los sábados de 18 a 21hs. A partir del mes
                                                                        Julio/24 hasta Diciembre/28, ante las
                                                                        autoridades del canal cuya entrega quedará
                                                                        asentada en un acta. Mi Primer Casa S.A. se
                                                                        reserva el derecho a publicitar.
                                                                    </li>
                                                                    <li>PREMIOS MAYORES: Se sorteará en el Diciembre 28
                                                                        del 2024 ante escribano público.
                                                                    </li>
                                                                    <p>COMERCIALIZA: MI PRIMER CASA - FOTHERINGHAM
                                                                        1089(FORMOSA)</p>
                                                                </ol>
                                                                <span style="display: flex; justify-content: center"
                                                                    id="closeBases" class="btn-bases">Aceptar</span>
                                                            </article>
                                                        </div>

                                                        <span id="btnBases" class="btn-bases btn-ver-bases">Ver Bases y
                                                            Condiciones
                                                        </span>




                                                        <div class="xxxxcontenedor-inputsxxxx">

                                                            <div>
                                                                <asp:Label ID="olblCelularNumeroMensaje" runat="server"
                                                                    Text="Hola" Font-Bold="true"></asp:Label>

                                                                <asp:Panel ID="PanelConNumeroCelular" runat="server"
                                                                    Visible="false">
                                                                    <div id="msj-whatsapp">
                                                                        <div class="msj-whatsapp">
                                                                            <span class="texto-rojo">Envía un mensaje
                                                                                por Whatsapp Para Validar tu número y
                                                                                comenzar la compra</span>
                                                                            <%--<a class="btn-whatsapp"
                                                                                href="https://wa.me/543704779106?text=XEDSOA883wXXbks"
                                                                                target="_blank"
                                                                                rel="noopener noreferrer">
                                                                                <i class="bi bi-whatsapp"></i>
                                                                                </a>--%>
                                                                                <a id="btn-whatsapp"
                                                                                    class="btn-whatsapp">
                                                                                    <i class="bi bi-whatsapp"></i>
                                                                                </a>
                                                                        </div>
                                                                        <div class="texto-rojo">
                                                                            Luego, hacé clic en el botón<div
                                                                                class="btn-muestra">Verificar</div>
                                                                        </div>
                                                                    </div>
                                                                </asp:Panel>
                                                                <asp:Panel ID="PanelSinNumeroCelular" runat="server"
                                                                    Visible="false">


                                                                    <div class="contenedor-inputs">
                                                                        <asp:Label ID="Label15" runat="server"
                                                                            Text="Apellido y Nombres:"></asp:Label>
                                                                        <asp:TextBox ID="otxtClienteApyNom"
                                                                            runat="server" Enabled="false">
                                                                        </asp:TextBox>
                                                                    </div>
                                                                    <div class="contenedor-inputs">
                                                                        <asp:Label ID="Label3" runat="server"
                                                                            Text="Correo electrónico:"></asp:Label>
                                                                        <asp:TextBox ID="otxtCorreoElectronico"
                                                                            runat="server" Enabled="false">
                                                                        </asp:TextBox>

                                                                    </div>

                                                                    <div class="contenedor-inputs">
                                                                        <div id="contenedor-nro-celular">
                                                                            <asp:Label ID="Label4" runat="server"
                                                                                Text="Número de celular:"></asp:Label>
                                                                            <asp:TextBox ID="otxtCelularNumero"
                                                                                runat="server" Enabled="false"
                                                                                Width="45%"></asp:TextBox>
                                                                            <p id="texto-validador-celular"
                                                                                class="text-center texto-rojo">Celular
                                                                                No Validado</p>
                                                                        </div>

                                                                        <asp:Label ID="olblCelularNumeroValidadoMensaje"
                                                                            CssClass="msj-validar-celular"
                                                                            runat="server" Text="" Font-Bold="true"
                                                                            ForeColor="Red"></asp:Label>
                                                                    </div>




                                                                    <asp:Panel ID="PanelClienteMensajeValidacion"
                                                                        runat="server" Visible="true">


                                                                        <div>
                                                                            <asp:Label ID="olblSinNumeroCelularMensaje"
                                                                                runat="server"
                                                                                Text="Hola ! Necesitamos validar tu celular para enviarte las notificaciones que la Empresa requiere para informar el resultado de los sorteos semanales."
                                                                                Font-Bold="False"></asp:Label>

                                                                            <br />
                                                                            <asp:Label ID="olblSinNumeroCelularMensaje2"
                                                                                runat="server"
                                                                                Text="Al completar los datos de tu apelludo y nombres y correo electrónico , aparecerá un boton de Whatsapp con el que podras enviarnos el codigo personal que figura abajo de manera automática."
                                                                                Font-Bold="False"></asp:Label>


                                                                            <asp:Label ID="olblSinNumeroCelularMensaje3"
                                                                                runat="server" Text="CODIGO PERSONAL:"
                                                                                Font-Bold="false"></asp:Label>
                                                                            <asp:Label
                                                                                ID="olblSinNumeroCelularMensajeCodigoPersonal"
                                                                                runat="server" Text="" Font-Bold="true">
                                                                            </asp:Label>

                                                                        </div>
                                                                    </asp:Panel>

                                                                    <asp:Panel ID="PanelWhatsappSesion" runat="server"
                                                                        Visible="true">
                                                                        <%-- Añadir la sesión como mensaje a este número
                                                                            --%>
                                                                            <%--href="https: //wa.me/543704779106"
                                                                                target="_blank" rel="noopener noreferrer--%>
                             <a id=" btn-whatsapp-session" class="btn-whatsapp text-center">
                                                                                <i class="bi bi-whatsapp"></i>
                                                                                </a>
                                                                                <asp:Button ID="obutValidacionVerifica"
                                                                                    runat="server" Text="Verificar"
                                                                                    CssClass="btn btn-numeros" />

                                                                                <%-- Imagen botón verificar --%>
                                                                                    <asp:Image ID="oimgCelularVerifica"
                                                                                        runat="server" Height="27px"
                                                                                        ImageUrl="~/ventaWEB/images/botonVerificaCelular.jpg"
                                                                                        Width="102px" />


                                                                                    <asp:Label
                                                                                        ID="olblCelularNumeroValidado"
                                                                                        runat="server" Text="">
                                                                                    </asp:Label>
                                                                    </asp:Panel>
                                                                </asp:Panel>

                                                            </div>

                                                        </div>

                                                        <%-- Botón que dirija al whatsapp --%>


                                                            <%-- Chevrón - Flecha indicadora que hay que hacer scroll
                                                                --%>
                                                                <div id="chevron" class="chevron"
                                                                    style="display: none;">
                                                                    <img src="images/chevron-abajo.png" alt="chevron" />
                                                                </div>


                                                                <div class="btn-formulario contenedor-inputs">
                                                                    <div class="contenedor-inputs">
                                                                    </div>
                                                                    <asp:Label ID="olblMensajeValidacion" runat="server"
                                                                        Text="" ForeColor="Red"></asp:Label>
                                                                </div>
                                                                <%-- Formulario Cliente --%>




                                                </div>

                                            </asp:Panel>



                                            <%-- Panel Sorteo --%>
                                                <div class="principal-buttons">


                                                    <div class="container">
                                                        <div class="panel-numeros-mas-boton">
                                                            <%-- <span class="text">
                                                                <asp:Label ID="Label3" runat="server" Text="Paso 1 ->">
                                                                </asp:Label>
                                                                </span>--%>

                                                                <div id="panel-numeros">
                                                                    <%--<asp:Button ID="obutNumeros" runat="server"
                                                                        Text="Números" CssClass="btn btn-numeros" />--%>
                                                                    <asp:Panel ID="PanelNumeros" runat="server">
                                                                        <%-- Botón Números --%>
                                                                            <asp:Button ID="obutNumeros" runat="server"
                                                                                Text="Números"
                                                                                CssClass="btn btn-numeros" />



                                                                            <%-- Botón Panel Números --%>
                                                                                <div>
                                                                                    <asp:TextBox ID="otxtCantidad"
                                                                                        runat="server" Text="8"
                                                                                        Enabled="false" Visible="false">
                                                                                    </asp:TextBox>
                                                                                    <asp:TextBox ID="otxtNumeroDesde"
                                                                                        runat="server" Text="0"
                                                                                        Enabled="false" Visible="false">
                                                                                    </asp:TextBox>
                                                                                </div>

                                                                                <div align="center"
                                                                                    class="panel-numeros">

                                                                                    <asp:Label CssClass="info-billetes"
                                                                                        ID="olblBilletesSeleccionadosCantidad"
                                                                                        runat="server" Text=""
                                                                                        ForeColor="Blue"
                                                                                        Font-Bold="true" Visible="true">
                                                                                    </asp:Label>

                                                                                    <asp:Label CssClass="info-billetes"
                                                                                        ID="olblBilletesSeleccionados"
                                                                                        runat="server" Text=""
                                                                                        ForeColor="Blue"
                                                                                        Font-Bold="true" Visible="true">
                                                                                    </asp:Label>
                                                                                    <p class="info-validacion">
                                                                                        <asp:Label CssClass="msj-talon"
                                                                                            ID="olblValidacionMensajeError"
                                                                                            runat="server" Text=""
                                                                                            ForeColor="Red"
                                                                                            Font-Bold="true">
                                                                                        </asp:Label>
                                                                                        <asp:Label CssClass="msj-talon"
                                                                                            ID="olblGestionCodigo"
                                                                                            runat="server" Text=""
                                                                                            Font-Bold="true"
                                                                                            Visible="false"></asp:Label>
                                                                                        <asp:Label CssClass="msj-talon"
                                                                                            ID="olblGestionDescripcion"
                                                                                            runat="server" Text=""
                                                                                            Font-Bold="true">
                                                                                        </asp:Label>
                                                                                    </p>

                                                                                    <asp:SqlDataSource
                                                                                        ID="odssorteoTalonVendedorVenta"
                                                                                        runat="server"
                                                                                        ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>"
                                                                                        SelectCommand="sorteoTalonVendedorVentaWEB"
                                                                                        SelectCommandType="StoredProcedure">
                                                                                        <SelectParameters>
                                                                                            <asp:ControlParameter
                                                                                                ControlID="IdOperador"
                                                                                                Name="idOperador"
                                                                                                PropertyName="Text"
                                                                                                Type="Int32" />
                                                                                            <asp:ControlParameter
                                                                                                ControlID="olblIdSorteo"
                                                                                                Name="idSorteo"
                                                                                                PropertyName="Text"
                                                                                                Type="Int32" />
                                                                                            <asp:ControlParameter
                                                                                                ControlID="otxtCantidad"
                                                                                                Name="cantidadVisualiza"
                                                                                                PropertyName="Text"
                                                                                                Type="Int32" />
                                                                                            <asp:ControlParameter
                                                                                                ControlID="otxtNumeroDesde"
                                                                                                Name="numeroDesde"
                                                                                                PropertyName="Text"
                                                                                                Type="Int32" />
                                                                                            <asp:ControlParameter
                                                                                                ControlID="olblSession"
                                                                                                Name="sorteoTalonSession"
                                                                                                PropertyName="Text"
                                                                                                Type="String" />
                                                                                        </SelectParameters>
                                                                                    </asp:SqlDataSource>
                                                                                    <asp:GridView
                                                                                        ID="ogvSorteoTalonVendedorVenta"
                                                                                        runat="server"
                                                                                        AutoGenerateColumns="False"
                                                                                        DataKeyNames="idSorteoTalon"
                                                                                        DataSourceID="odssorteoTalonVendedorVenta"
                                                                                        CssClass="table-cemmi tabla-numeros">
                                                                                        <Columns>
                                                                                            <asp:TemplateField
                                                                                                HeaderText="idSorteoTalon"
                                                                                                InsertVisible="False"
                                                                                                SortExpression="idSorteoTalon"
                                                                                                Visible="False">
                                                                                                <EditItemTemplate>
                                                                                                    <asp:Label
                                                                                                        ID="Label1"
                                                                                                        runat="server"
                                                                                                        Text='<%# Eval("idSorteoTalon") %>'>
                                                                                                    </asp:Label>
                                                                                                </EditItemTemplate>
                                                                                                <ItemTemplate>
                                                                                                    <asp:Label
                                                                                                        ID="olblIdSorteoTalon"
                                                                                                        runat="server"
                                                                                                        Text='<%# Bind("idSorteoTalon") %>'>
                                                                                                    </asp:Label>
                                                                                                </ItemTemplate>
                                                                                            </asp:TemplateField>
                                                                                            <asp:BoundField
                                                                                                DataField="sorteoTalonNumero"
                                                                                                HeaderText="Números Disponibles"
                                                                                                SortExpression="sorteoTalonNumero">
                                                                                                <HeaderStyle
                                                                                                    HorizontalAlign="Center" />
                                                                                                <ItemStyle
                                                                                                    HorizontalAlign="Center" />
                                                                                            </asp:BoundField>
                                                                                            <asp:TemplateField
                                                                                                HeaderText="Seleccione su número <br/><b> &#x2198; ⬇⬇⬇  &#x2199;</b>"
                                                                                                SortExpression="sorteoTalonTomado">
                                                                                                <%-- Tabla números --%>
                                                                                                    <ItemTemplate>
                                                                                                        <asp:CheckBox
                                                                                                            ID="ochSorteoTalonTomado"
                                                                                                            runat="server"
                                                                                                            Checked='<%# Bind("sorteoTalonTomado") %>'
                                                                                                            Enabled="True"
                                                                                                            AutoPostBack="true"
                                                                                                            OnCheckedChanged="talonVendedorToma"
                                                                                                            CssClass="tabla-checkbox" />
                                                                                                    </ItemTemplate>
                                                                                                    <HeaderStyle
                                                                                                        HorizontalAlign="Center" />
                                                                                                    <ItemStyle
                                                                                                        HorizontalAlign="Center" />
                                                                                            </asp:TemplateField>
                                                                                        </Columns>
                                                                                    </asp:GridView>
                                                                                    <%-- Footer Panel Números --%>
                                                                                        <div
                                                                                            class="footer-panel-numeros">
                                                                                            <asp:Button
                                                                                                CssClass="btn-footer-panel-numeros"
                                                                                                ID="obutRango01"
                                                                                                runat="server"
                                                                                                Text="Muestra 10 números" />
                                                                                            <asp:Button
                                                                                                CssClass="btn-footer-panel-numeros"
                                                                                                ID="obutRango02"
                                                                                                runat="server"
                                                                                                Text="Muestra 30 números" />
                                                                                        </div>
                                                                                </div>

                                                                    </asp:Panel>
                                                                </div>
                                                        </div>


                                                        <div class="container-premios" id="panel-premios">
                                                            <%--<span class="text">
                                                                <asp:Label ID="Label4" runat="server" Text="Paso 2 ->">
                                                                </asp:Label>
                                                                </span>--%>
                                                                <div>

                                                                    <asp:Panel ID="PanelPremio" runat="server"
                                                                        Visible="true">
                                                                        <%-- Botón Premios --%>
                                                                            <div id="btn-premios-container"
                                                                                class="btn-premios-container">
                                                                                <asp:Button ID="obutPremios"
                                                                                    runat="server" Text="VER PREMIOS"
                                                                                    CssClass="btn btn-premios"
                                                                                    Enabled="false" />
                                                                            </div>


                                                                            <%-- Panel Premios --%>



                                                                                <div align="center">
                                                                                    <asp:Label ID="Label6"
                                                                                        runat="server"
                                                                                        Text="Complete cada talón con el premio y luego confirme ">
                                                                                    </asp:Label>

                                                                                </div>

                                                                                <div class="panel-premios">
                                                                                    <asp:SqlDataSource
                                                                                        ID="odsSorteoPremio"
                                                                                        runat="server"
                                                                                        ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>"
                                                                                        SelectCommand="SORTEOPREMIOWEBTraeroddlDescending"
                                                                                        SelectCommandType="StoredProcedure">
                                                                                    </asp:SqlDataSource>

                                                                                    <asp:SqlDataSource
                                                                                        ID="odsSorteoVendedorTalonSeleccionado"
                                                                                        runat="server"
                                                                                        ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>"
                                                                                        SelectCommand="SorteoVendedorTalonSeleccionadoWEB"
                                                                                        SelectCommandType="StoredProcedure">
                                                                                        <SelectParameters>
                                                                                            <asp:ControlParameter
                                                                                                ControlID="olblSession"
                                                                                                Name="sorteoTalonSession"
                                                                                                PropertyName="Text"
                                                                                                Type="String" />
                                                                                        </SelectParameters>
                                                                                    </asp:SqlDataSource>
                                                                                    <asp:GridView
                                                                                        ID="ogvSorteoVendedorTalonSeleccionado"
                                                                                        runat="server"
                                                                                        AutoGenerateColumns="False"
                                                                                        DataKeyNames="idSorteoTalon"
                                                                                        DataSourceID="odsSorteoVendedorTalonSeleccionado"
                                                                                        CssClass="table-cemmi"
                                                                                        EmptyDataText="TODAVIA NO HA SELECCIONADO NINGUN NUMERO - Tilde los numeros de billete que sean de su eleccion y luego asigne el premio por el que desea participar en cada caso.">
                                                                                        <Columns>
                                                                                            <asp:TemplateField
                                                                                                HeaderText="idSorteoTalon"
                                                                                                InsertVisible="False"
                                                                                                SortExpression="idSorteoTalon"
                                                                                                Visible="False">
                                                                                                <ItemTemplate>
                                                                                                    <asp:Label
                                                                                                        ID="olblIdSorteoTalon"
                                                                                                        runat="server"
                                                                                                        Text='<%# Bind("idSorteoTalon") %>'>
                                                                                                    </asp:Label>
                                                                                                </ItemTemplate>
                                                                                            </asp:TemplateField>
                                                                                            <asp:BoundField
                                                                                                DataField="sorteoTalonNumero"
                                                                                                HeaderText="NUMERO"
                                                                                                SortExpression="sorteoTalonNumero">
                                                                                                <ControlStyle
                                                                                                    Width="20%" />
                                                                                                <ItemStyle
                                                                                                    Font-Bold="True"
                                                                                                    HorizontalAlign="Center" />
                                                                                            </asp:BoundField>
                                                                                            <asp:TemplateField
                                                                                                HeaderText="P R E M I O S"
                                                                                                SortExpression="idSorteoPremio">
                                                                                                <ItemTemplate>
                                                                                                    <asp:DropDownList
                                                                                                        ID="oddlPremio"
                                                                                                        runat="server"
                                                                                                        DataSourceID="odsSorteoPremio"
                                                                                                        DataTextField="sorteoPremioDescripcion"
                                                                                                        DataValueField="idSorteoPremio"
                                                                                                        SelectedValue='<%# Bind("idSorteoPremio")%>'
                                                                                                        AutoPostBack="True"
                                                                                                        Width="80%"
                                                                                                        OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                                                                                                    </asp:DropDownList>
                                                                                                </ItemTemplate>
                                                                                                <ControlStyle
                                                                                                    Width="100%" />
                                                                                                <HeaderStyle
                                                                                                    Width="60%" />
                                                                                                <ItemStyle
                                                                                                    CssClass="select-premios"
                                                                                                    Width="60%"
                                                                                                    HorizontalAlign="Center"
                                                                                                    Font-Size="X-Small" />
                                                                                            </asp:TemplateField>
                                                                                            <asp:BoundField
                                                                                                DataField="Precio"
                                                                                                HeaderText="PRECIO"
                                                                                                ReadOnly="True"
                                                                                                SortExpression="sorteoTalonMonto"
                                                                                                DataFormatString="{0:c}">
                                                                                                <ControlStyle
                                                                                                    Width="20%" />
                                                                                                <ItemStyle
                                                                                                    HorizontalAlign="Right"
                                                                                                    Font-Bold="True" />
                                                                                            </asp:BoundField>
                                                                                        </Columns>
                                                                                    </asp:GridView>
                                                                                </div>
                                                                                <%-- Modal Premios Principales --%>
                                                                                    <div id="premiosPrincipales"
                                                                                        class="modal">
                                                                                        <div class="modal-content">
                                                                                            <span id="closeModalPremios"
                                                                                                class="close-modal"><span
                                                                                                    class="texto-cerrar">Cerrar</span>&times;</span>
                                                                                            <div
                                                                                                class="transaccion-cliente">
                                                                                                <p class="texto-modal">
                                                                                                    ¡Elegí cuáles de
                                                                                                    estos increíbles
                                                                                                    premios te gustaría
                                                                                                    GANAR! 🤩🎉🎊</p>
                                                                                            </div>
                                                                                            <div
                                                                                                class="modal-images-principales">
                                                                                                <figure>
                                                                                                    <img src="images/premios-sorteo/principales/sandero.png"
                                                                                                        alt="Auto" />
                                                                                                    <img src="images/premios-sorteo/principales/terreno.jpg"
                                                                                                        alt="Terreno" />
                                                                                                    <figcaption>
                                                                                                        <div>
                                                                                                            <img
                                                                                                                src="images/premios-sorteo/principales/primer-premio.png" />
                                                                                                            <h3
                                                                                                                class="white-text">
                                                                                                                Un
                                                                                                                Terreno
                                                                                                                y Un
                                                                                                                0km.
                                                                                                            </h3>
                                                                                                        </div>
                                                                                                    </figcaption>
                                                                                                </figure>
                                                                                                <figure>
                                                                                                    <img src="images/premios-sorteo/principales/terreno.jpg"
                                                                                                        alt="Terreno" />
                                                                                                    <figcaption>
                                                                                                        <div>
                                                                                                            <img
                                                                                                                src="images/premios-sorteo/principales/segundo-premio.png" />
                                                                                                            <h3
                                                                                                                class="white-text">
                                                                                                                Un
                                                                                                                Terreno
                                                                                                            </h3>
                                                                                                        </div>
                                                                                                    </figcaption>
                                                                                                </figure>
                                                                                                <figure>
                                                                                                    <img src="images/premios-sorteo/principales/dinero-1.jpg"
                                                                                                        alt="Dinero" />
                                                                                                    <figcaption>
                                                                                                        <div>
                                                                                                            <img
                                                                                                                src="images/premios-sorteo/principales/tercer-premio.png" />
                                                                                                            <h3
                                                                                                                class="white-text">
                                                                                                                $5.000.000
                                                                                                            </h3>
                                                                                                        </div>

                                                                                                    </figcaption>
                                                                                                </figure>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                    <%--Footer Panel Premios--%>
                                                                                        <div
                                                                                            class="footer-panel-premios">
                                                                                            <asp:Label ID="Label7"
                                                                                                runat="server"
                                                                                                Text="Cantidad de talones seleccionados :  ">
                                                                                            </asp:Label>
                                                                                            <asp:Label
                                                                                                ID="olblCantidadTotal"
                                                                                                runat="server" Text="0">
                                                                                            </asp:Label>
                                                                                        </div>


                                                                                        <div
                                                                                            class="footer-panel-premios">
                                                                                            <asp:Label ID="Label8"
                                                                                                runat="server"
                                                                                                Text="Importe de los talones seleccionados : ">
                                                                                            </asp:Label>
                                                                                            <div class="total">
                                                                                                <asp:Label ID="Label9"
                                                                                                    runat="server"
                                                                                                    Text="$">
                                                                                                </asp:Label>
                                                                                                <asp:Label
                                                                                                    ID="olblMontoTotal"
                                                                                                    runat="server"
                                                                                                    Text="0">
                                                                                                </asp:Label>
                                                                                            </div>
                                                                                        </div>
                                                                                        <div>
                                                                                            <asp:Label
                                                                                                ID="olblValidacionMensajeErrores"
                                                                                                runat="server" Text="0"
                                                                                                Font-Bold="true"
                                                                                                ForeColor="Red"
                                                                                                Visible="false"
                                                                                                Font-Size="Small">
                                                                                            </asp:Label>
                                                                                            <asp:Label
                                                                                                CssClass="msj-error-premios"
                                                                                                ID="olblValidacionMensajeErrorPremio"
                                                                                                runat="server" Text="">
                                                                                            </asp:Label>
                                                                                        </div>

                                                                                        <div
                                                                                            class="msj-footer-panel-premios">

                                                                                            <%-- Oculto --%>
                                                                                                <asp:TextBox
                                                                                                    ID="otxtLeyendaPago"
                                                                                                    CssClass="panel-cvu-oculto"
                                                                                                    runat="server"
                                                                                                    Text="Si deseas agregar, quitar o cambiar NUMEROS, usa los botones números y premios, luego elija su FORMA DE PAGO."
                                                                                                    TextMode="MultiLine"
                                                                                                    BackColor="White"
                                                                                                    Enabled="false"
                                                                                                    Visible="false">
                                                                                                </asp:TextBox>

                                                                                                <%-- Éste es el que se
                                                                                                    muestra en pantalla
                                                                                                    --%>
                                                                                                    <p
                                                                                                        id="otxtLeyendaPago">
                                                                                                        Si desea
                                                                                                        agregar, quitar
                                                                                                        o cambiar
                                                                                                        NÚMEROS, use los
                                                                                                        botones números
                                                                                                        y premios, luego
                                                                                                        elija su FORMA
                                                                                                        DE PAGO.
                                                                                                    </p>
                                                                                        </div>
                                                                                        <%-- Boton Verde Pagar --%>
                                                                                            <div
                                                                                                style="text-align: center;">
                                                                                                <asp:Button
                                                                                                    ID="obutPagarConMercadoPAgo"
                                                                                                    runat="server"
                                                                                                    Text="PAGAR CON MERCADO PAGO "
                                                                                                    CssClass="btn-pago" />
                                                                                                <asp:Button
                                                                                                    ID="obutPagarConTransferencia"
                                                                                                    runat="server"
                                                                                                    Text="PAGAR CON TRANSFERENCIA"
                                                                                                    CssClass="btn-pago" />
                                                                                                <asp:Button
                                                                                                    ID="obutPagarConEfectivo"
                                                                                                    runat="server"
                                                                                                    Text="CON EFECTIVO"
                                                                                                    CssClass="btn-pago" />



                                                                                            </div>
                                                                    </asp:Panel>
                                                                </div>
                                                        </div>
                                                        <div>
                                                            <%-- <span class="text">
                                                                <asp:Label ID="Label5" runat="server" Text="Paso 3 ">
                                                                </asp:Label>
                                                                </span>--%>
                                                                <span>
                                                                    <asp:Button ID="obutCobrar" runat="server"
                                                                        Text="Pagar con Mercado Pago " CssClass="btn"
                                                                        Enabled="false" Width="30%" />


                                                                </span>
                                                        </div>
                                                    </div>
                                                </div>


                                                <%-- Panel Premio --%>


                                                    <asp:Panel ID="PanelConfirmaOperacion" runat="server"
                                                        Visible="false">
                                                        <asp:Panel ID="PanelValores" runat="server" Visible="false">
                                                            <div class="container-monto-a-pagar">
                                                                <div>
                                                                    <asp:Label ID="olblMedioPagoSeleccionado"
                                                                        runat="server" Text=""></asp:Label>
                                                                    <br />
                                                                </div>

                                                                <asp:Label ID="Label12" runat="server"
                                                                    Text="Monto a pagar :"></asp:Label>
                                                                <div class="monto-a-pagar">
                                                                    <%-- <span>$</span>--%>
                                                                        <asp:Label ID="olblPagoConfirmadoMonto"
                                                                            runat="server" Text=""></asp:Label>
                                                                </div>
                                                            </div>
                                                            <%--Botones medios de pago--%>
                                                                <%--<div class="botones-medios-de-pago">

                                                                    <asp:Button CssClass="btn-pago btn-metodo-pago"
                                                                        ID="obutOpcionPagoConMercadoPago" runat="server"
                                                                        Text="PAGAR CON MERCADO PAGO " />
                                                                    <asp:Button
                                                                        CssClass="btn-pago btn-metodo-pago disminuir-texto"
                                                                        ID="obutTransferenciaAMercadoPago"
                                                                        runat="server"
                                                                        Text="TRANSFERENCIA A MERCADO PAGO POR ALIAS" />
                                                                    <asp:Button CssClass="btn-pago btn-metodo-pago"
                                                                        ID="obutVolverFormasDePago" runat="server"
                                                                        Text="Mostrar Opciones de Pago"
                                                                        Visible="false" />

                                                                    </div>--%>



                                                                    <div>
                                                                        <asp:Label ID="olblMensajeGrabacionCobranza"
                                                                            runat="server" Text=""></asp:Label>
                                                                    </div>


                                                        </asp:Panel>


                                                        <asp:Panel ID="PanelEfectivo" runat="server" Visible="false">
                                                            <div>

                                                                <p class="cuenta-mp">
                                                                    <span>En esta opcion, se considera que la venta es
                                                                        presencial y usted esta en contacto con el
                                                                        vendedor para entregar el dinero.
                                                                        <%-- <a class="btn-whatsapp"
                                                                            href="https://wa.me/543705019399?text=Apellido y Nombre: "
                                                                            target="_blank" rel="noopener noreferrer">
                                                                            <i class="bi bi-whatsapp"></i>
                                                                            </a>--%>


                                                                    </span>
                                                                </p>
                                                                <asp:Button
                                                                    CssClass="no-style btn-copiar-cvu-alias btn-navigation"
                                                                    ID="obutVuelveSeleccionFormaPagoDesdeEfectivo"
                                                                    runat="server"
                                                                    Text="Vuelve a seleccionar forma de pago" />


                                                            </div>



                                                        </asp:Panel>


                                                        <%--Panel Mercado Pago --%>
                                                            <asp:Panel ID="PanelMercadoPago2" runat="server"
                                                                Visible="false">
                                                                <div>
                                                                    <p class="cuenta-mp">
                                                                        <span>Sera dirigido a su cuenta de Mercado Pago
                                                                            para abonar el importe seleccionado.
                                                                            Presione el Boton "Pagar con mi Mercado
                                                                            Pago"
                                                                        </span>
                                                                    </p>

                                                                    <a id="btn-pagar-mp"
                                                                        class="btn-copiar-cvu-alias text-center"
                                                                        href="https://link.mercadopago.com.ar/pagobilletesorteo"
                                                                        target="_blank">
                                                                        Confirmo compra con mi Mercado Pago
                                                                    </a>

                                                                    <asp:Button
                                                                        CssClass="btn-copiar-cvu-alias btn-navigation no-style"
                                                                        ID="obutVuelveSeleccionFormaPagoDesdeMP"
                                                                        runat="server"
                                                                        Text="Vuelve a seleccionar forma de pago" />
                                                                </div>



                                                            </asp:Panel>


                                                            <%--Panel Transferencia--%>
                                                                <asp:Panel ID="PanelTransferencia"
                                                                    CssClass="panel-transferencia" runat="server"
                                                                    Visible="false">
                                                                    <div align="center">
                                                                        <%--<asp:TextBox
                                                                            ID="otxtDatosBancoParaTransferencia01"
                                                                            runat="server" BackColor="LightGray"
                                                                            Width="90%"
                                                                            Text="Datos cuenta en MERCADO PAGO"
                                                                            Font-Bold="true" ClientIDMode="Static">
                                                                            </asp:TextBox>--%>
                                                                            <p class="cuenta-mp"
                                                                                name="otxtDatosBancoParaTransferencia01"
                                                                                id="otxtDatosBancoParaTransferencia01">
                                                                                Datos cuenta en MERCADO PAGO</p>
                                                                    </div>
                                                                    <div align="center">
                                                                        <%-- <asp:TextBox
                                                                            ID="otxtDatosBancoParaTransferencia02"
                                                                            runat="server" BackColor="LightGray"
                                                                            Width="90%"
                                                                            Text="CVU : 0000003100050215684489"
                                                                            Font-Bold="true" ClientIDMode="Static">
                                                                            </asp:TextBox>--%>
                                                                            <p class="cuenta-mp"
                                                                                name="otxtDatosBancoParaTransferencia02"
                                                                                id="otxtDatosBancoParaTransferencia02">
                                                                                CVU : 0000003100050215684489</p>
                                                                            <button type="button" id="btn-copiar-cvu"
                                                                                class="btn-copiar-cvu-alias">Copiar
                                                                                CVU</button>
                                                                    </div>
                                                                    <div align="center">
                                                                        <%--<asp:TextBox
                                                                            ID="otxtDatosBancoParaTransferencia03"
                                                                            runat="server" BackColor="LightGray"
                                                                            Width="90%"
                                                                            Text="ALIAS : sorteo.billete.mpc "
                                                                            Font-Bold="true" ClientIDMode="Static">
                                                                            </asp:TextBox>--%>
                                                                            <p class="cuenta-mp"
                                                                                id="otxtDatosBancoParaTransferencia03">
                                                                                ALIAS : sorteo.billete.mpc</p>
                                                                            <button type="button" id="btn-copiar-alias"
                                                                                class="btn-copiar-cvu-alias">Copiar
                                                                                Alias</button>
                                                                    </div>
                                                                    <div>
                                                                        <asp:Button
                                                                            CssClass="no style btn-copiar-cvu-alias btn-navigation"
                                                                            ID="obutVuelveSeleccionFormaPagoDesdeTransferencia"
                                                                            runat="server"
                                                                            Text="Vuelve a seleccionar forma de pago" />
                                                                    </div>
                                                                </asp:Panel>


                                                                <asp:Panel ID="PanelDialogoVendedor" runat="server"
                                                                    Visible="false">


                                                                    <div>
                                                                        <div align="center">
                                                                            <%-- <asp:TextBox ID="TextBox1"
                                                                                runat="server" BackColor="LightGray"
                                                                                Width="90%"
                                                                                Text="Una vez que realice la transferencia a la cuenta de la Empresa, deberá enviar la captura de pantalla de la misma al teléfono del Vendedor asignado , para que este confeccione los billetes seleccionado con sus datos y los ingrese en la urna luego de corroborar la acreditaciónm de la operación"
                                                                                Font-Bold="true" TextMode="MultiLine">
                                                                                </asp:TextBox>--%>
                                                                                <p class="cuenta-mp">
                                                                                    <%-- Una vez que realice la
                                                                                        transferencia a la cuenta de la
                                                                                        Empresa, deberá enviar la
                                                                                        captura de pantalla de la misma
                                                                                        al teléfono del vendedor
                                                                                        asignado, para que éste
                                                                                        confeccione los billetes
                                                                                        seleccionados con sus datos y
                                                                                        los ingrese en la urna luego de
                                                                                        corroborar la acreditación de la
                                                                                        operación.--%>
                                                                                        <%-- <asp:TextBox ID="TextBox2"
                                                                                            runat="server"
                                                                                            BackColor="LightGray"
                                                                                            Width="90%"
                                                                                            Text="Datos del Vendedor  Martin Ramon Quintana , Celular Número + 54 9 370 501 9399"
                                                                                            Font-Bold="true"
                                                                                            TextMode="MultiLine">
                                                                                            </asp:TextBox>--%>
                                                                                            <span>Para confirmar su
                                                                                                compra, el vendedor
                                                                                                <span
                                                                                                    id="vendedor-nombre"></span><%--Ramón
                                                                                                    Quintana (+54 9 370
                                                                                                    501 9399)--%> <span
                                                                                                        id="vendedor-celular"></span>
                                                                                                    se comunicará con
                                                                                                    usted en la
                                                                                                    brevedad, o tiene la
                                                                                                    opcion de
                                                                                                    comunicarse mediante
                                                                                                    este link<a
                                                                                                        class="btn-whatsapp"
                                                                                                        id="enlace-whatsapp-vendedor"
                                                                                                        href="https://wa.me/543705019399?text=Apellido y Nombre: "
                                                                                                        target="_blank"
                                                                                                        rel="noopener noreferrer">
                                                                                                        <i
                                                                                                            class="bi bi-whatsapp"></i>
                                                                                                    </a>
                                                                                            </span>
                                                                                </p>
                                                                                <div
                                                                                    class="texto-rojo cuenta-mp texto-con-sombra">
                                                                                    LUEGO CONFIRME SU COMPRA</div>
                                                                        </div>
                                                                        <div align="center">
                                                                            <asp:Button ID="obutConfirmaOperacion"
                                                                                runat="server" Text="CONFIRMAR COMPRA"
                                                                                CssClass="btn-pago" />
                                                                        </div>

                                                                        <%-- <div
                                                                            class="transaccion-cliente texto-compra-confirmada">
                                                                            <p>
                                                                                Felicitaciones por su compra - Rellene
                                                                                la encuesta y participe del sorteo de 3
                                                                                electrodomesticos: foto de heladera,
                                                                                cocina, freidora. 28 de diciembre 2024.
                                                                            </p>
                                                                    </div>--%>
                                                                    </div>
                                                                </asp:Panel>

                                                                <%-- Modal premios de encuesta --%>
                                                                    <div id="myModal" class="modal">
                                                                        <div class="modal-content">
                                                                            <span id="closeModalBtn"
                                                                                class="close-modal"><span
                                                                                    class="texto-cerrar">Cerrar</span>&times;</span>
                                                                            <div class="transaccion-cliente">
                                                                                <p class="texto-modal">
                                                                                    ¡Felicidades! 🎉🎊 ¡Ya estás
                                                                                    participando en los grandes sorteos
                                                                                    de diciembre! Completá la encuesta y
                                                                                    aprovechá la oportunidad de seguir
                                                                                    ganando increíbles premios. 🎁 ¡No
                                                                                    te lo pierdas!
                                                                                </p>
                                                                            </div>
                                                                            <div class="modal-images">
                                                                                <figure>
                                                                                    <article class="img-sorteo">
                                                                                        <img src="images/premios-sorteo/heladera-midea-2.jpg"
                                                                                            alt="Heladera con freezer Midea" />
                                                                                    </article>
                                                                                    <figcaption>
                                                                                        <div>
                                                                                            <img
                                                                                                src="images/premios-sorteo/principales/primer-premio.png" />
                                                                                            <h3>Heladera con Congelador
                                                                                                Midea</h3>

                                                                                        </div>
                                                                                        <article>

                                                                                            <p>Capacidad 300 Litros</p>
                                                                                            <p>Control de temperatura
                                                                                                ajustable</p>
                                                                                            <p>Vidrio templado</p>--%>
                                                                                        </article>
                                                                                    </figcaption>
                                                                                </figure>
                                                                                <figure>
                                                                                    <article class="img-sorteo">
                                                                                        <img src="images/premios-sorteo/cocina-atlas-2.jpg"
                                                                                            alt="Cocina Atlas" />
                                                                                    </article>
                                                                                    <figcaption>
                                                                                        <div>
                                                                                            <img
                                                                                                src="images/premios-sorteo/principales/segundo-premio.png" />
                                                                                            <h3>Cocina Atlas Coliseum
                                                                                                Plus</h3>

                                                                                        </div>
                                                                                        <article>

                                                                                            <p>Cuatro hornallas</p>
                                                                                            <p>Tapa de vidrio</p>
                                                                                            <p>Capacidad de horno: 50
                                                                                                Lts</p>
                                                                                        </article>
                                                                                    </figcaption>
                                                                                </figure>
                                                                                <figure>
                                                                                    <article class="img-sorteo">
                                                                                        <img src="images/premios-sorteo/freidora-marylan-2.jpg"
                                                                                            alt="Freidora de aire Marylan" />
                                                                                    </article>
                                                                                    <figcaption>
                                                                                        <div>
                                                                                            <img
                                                                                                src="images/premios-sorteo/principales/tercer-premio.png" />

                                                                                            <h3>Air Fryer Marylan</h3>

                                                                                        </div>
                                                                                        <article>
                                                                                            <p>1400Watts</p>
                                                                                            <p>Capacidad 5.5 Litros</p>
                                                                                            <p>Hasta 200 grados</p>s
                                                                                        </article>
                                                                                    </figcaption>
                                                                                </figure>
                                                                            </div>
                                                                        </div>
                                                                    </div>


                                                                    <%--Panel Encuesta--%>
                                                                        <asp:Panel class="panel-encuesta"
                                                                            ID="PanelEncuesta" runat="server"
                                                                            Visible="false">
                                                                            <div align="center">
                                                                                <%-- <h4 class="titulo-panel-encuesta">
                                                                                    <asp:Label ID="Label19"
                                                                                        runat="server"
                                                                                        Text="¡Complete ésta breve encuesta y participe por excelentes premios!"
                                                                                        Font-Bold="true"></asp:Label>
                                                                                    </h4>--%>
                                                                                    <div id="Label19"
                                                                                        class="titulo-panel-encuesta">
                                                                                        ¡Completá ésta breve <span
                                                                                            id="link-encuesta"
                                                                                            class="btn-basic link-encuesta">encuesta</span>
                                                                                        y participá por nuevos premios!
                                                                                    </div>
                                                                            </div>
                                                                            <div class="transaccion-cliente">


                                                                                <%-- Botón mostrar premio de encuesta
                                                                                    --%>
                                                                                    <button id="openModalBtn"
                                                                                        class="open-modal-btn btn-bases btn-ver-bases btn-premios-encuesta"
                                                                                        type="button">VER PREMIOS
                                                                                        ENCUESTA</button>
                                                                            </div>

                                                                            <asp:Panel CssClass="seccion-encuesta"
                                                                                ID="PanelEncuesta_inversion"
                                                                                runat="server">
                                                                                <div align="center" class="section-1"
                                                                                    id="contenido-encuesta">
                                                                                    <asp:Label
                                                                                        CssClass="titulo-seccion-encuesta titulo-1"
                                                                                        ID="Label18" runat="server"
                                                                                        Text="¿Quiere invertir? ¿En qué rango de cuota se situaría?">
                                                                                    </asp:Label>
                                                                                    <asp:RadioButtonList
                                                                                        CssClass="seccion-1"
                                                                                        ID="orbEncuesta_inversion"
                                                                                        runat="server">
                                                                                        <asp:ListItem Selected="True"
                                                                                            Value="0">No contesta
                                                                                        </asp:ListItem>
                                                                                        <asp:ListItem Value="1">Hasta $
                                                                                            50.000</asp:ListItem>
                                                                                        <asp:ListItem Value="2">Hasta $
                                                                                            70.000</asp:ListItem>
                                                                                        <asp:ListItem Value="3">Hasta $
                                                                                            90.000</asp:ListItem>
                                                                                        <asp:ListItem Value="4">Hasta $
                                                                                            120.000</asp:ListItem>
                                                                                        <asp:ListItem Value="5">Mas de $
                                                                                            120.000</asp:ListItem>
                                                                                    </asp:RadioButtonList>
                                                                                </div>
                                                                            </asp:Panel>
                                                                            <asp:Panel CssClass="seccion-encuesta"
                                                                                ID="PanelEncuesta_esPropietario"
                                                                                runat="server">
                                                                                <div align="center">
                                                                                    <asp:Label
                                                                                        CssClass="titulo-seccion-encuesta titulo-2"
                                                                                        ID="Label20" runat="server"
                                                                                        Text="¿Es propietario?">
                                                                                    </asp:Label>
                                                                                    <asp:RadioButtonList
                                                                                        CssClass="seccion-2"
                                                                                        ID="orbEncuesta_esPropietario"
                                                                                        runat="server">
                                                                                        <asp:ListItem Selected="True"
                                                                                            Value="0">No contesta
                                                                                        </asp:ListItem>
                                                                                        <asp:ListItem Value="1">SI
                                                                                        </asp:ListItem>
                                                                                        <asp:ListItem Value="2">NO
                                                                                        </asp:ListItem>
                                                                                    </asp:RadioButtonList>
                                                                                </div>
                                                                            </asp:Panel>

                                                                            <asp:Panel CssClass="seccion-encuesta"
                                                                                ID="PanelEncuesta_alquila"
                                                                                runat="server">
                                                                                <div align="center">
                                                                                    <asp:Label
                                                                                        CssClass="titulo-seccion-encuesta titulo-3"
                                                                                        ID="Label21" runat="server"
                                                                                        Text="¿Alquila?"></asp:Label>
                                                                                    <asp:RadioButtonList
                                                                                        CssClass="seccion-3"
                                                                                        ID="orbEncuesta_alquila"
                                                                                        runat="server">
                                                                                        <asp:ListItem Selected="True"
                                                                                            Value="0">No contesta
                                                                                        </asp:ListItem>
                                                                                        <asp:ListItem Value="1">SI
                                                                                        </asp:ListItem>
                                                                                        <asp:ListItem Value="2">NO
                                                                                        </asp:ListItem>
                                                                                    </asp:RadioButtonList>
                                                                                </div>
                                                                            </asp:Panel>
                                                                            <asp:Panel CssClass="seccion-encuesta"
                                                                                ID="PanelEncuesta_esClienteMPC"
                                                                                runat="server">
                                                                                <div align="center" class="seccion-4">
                                                                                    <asp:Label
                                                                                        CssClass="titulo-seccion-encuesta titulo-4"
                                                                                        ID="Label22" runat="server"
                                                                                        Text="¿Es cliente de MI PRIMER CASA?">
                                                                                    </asp:Label>
                                                                                    <asp:RadioButtonList
                                                                                        ID="orbEncuesta_esClienteMPC"
                                                                                        runat="server">
                                                                                        <asp:ListItem Selected="True"
                                                                                            Value="0">No contesta
                                                                                        </asp:ListItem>
                                                                                        <asp:ListItem Value="1">SI
                                                                                        </asp:ListItem>
                                                                                        <asp:ListItem Value="2">NO
                                                                                        </asp:ListItem>
                                                                                    </asp:RadioButtonList>
                                                                                </div>
                                                                            </asp:Panel>

                                                                            <asp:Panel CssClass="seccion-encuesta"
                                                                                ID="PanelEncuesta_enQueInvertiria"
                                                                                runat="server">
                                                                                <div align="center" class="seccion-5">
                                                                                    <asp:Label
                                                                                        CssClass="titulo-seccion-encuesta titulo-5"
                                                                                        ID="Label23" runat="server"
                                                                                        Text="¿En qué invertiría?">
                                                                                    </asp:Label>
                                                                                    <asp:RadioButtonList
                                                                                        ID="orbEncuesta_enQueInvertiria"
                                                                                        runat="server">
                                                                                        <asp:ListItem Selected="True"
                                                                                            Value="0">No contesta
                                                                                        </asp:ListItem>
                                                                                        <asp:ListItem Value="1">
                                                                                            DEPARTAMENTO</asp:ListItem>
                                                                                        <asp:ListItem Value="2">TERRENO
                                                                                        </asp:ListItem>
                                                                                        <asp:ListItem Value="3">CASA
                                                                                        </asp:ListItem>

                                                                                    </asp:RadioButtonList>
                                                                                </div>
                                                                            </asp:Panel>
                                                                        </asp:Panel>



                                                                        <asp:Panel ID="PanelAlta" runat="server"
                                                                            Visible="false">


                                                                            <div align="center">
                                                                                <asp:TextBox
                                                                                    CssClass="msj-felicitaciones"
                                                                                    ID="Label25" runat="server"
                                                                                    Text="¡¡Felicitaciones!! 🎉 ¡Usted ya está participando por los premios mayores de los sorteos de Octubre! 🎁"
                                                                                    TextMode="MultiLine" Enabled="false"
                                                                                    BorderWidth="0"></asp:TextBox>
                                                                                <div
                                                                                    class="botones-medios-de-pago contenedor-inputs">
                                                                                </div>

                                                                                <asp:Label ID="olblOperacionRealizada"
                                                                                    runat="server" Text=""
                                                                                    Font-Bold="true"
                                                                                    ForeColor="#0033cc"></asp:Label>

                                                                                <br />
                                                                                <asp:Button ID="obutOperacionRealizada"
                                                                                    runat="server"
                                                                                    Text="Volver para nueva compra"
                                                                                    CssClass="btn-primary" Height="30%"
                                                                                    Width="50%" Visible="true" />
                                                                                <asp:Button
                                                                                    ID="obutOperacionRealizadaYPagina"
                                                                                    runat="server"
                                                                                    Text="Visitar pagina institucional"
                                                                                    CssClass="btn-primary" Height="30%"
                                                                                    Width="50%" Visible="true" />

                                                                            </div>

                                                                        </asp:Panel>
                                                    </asp:Panel>


                                                    <%-- Panel Upload --%>

                                                        <%-- </ContentTemplate>

                                                            </asp:UpdatePanel>--%>
                </form>

                <%-- Sweet Alert --%>
                    <%--<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>--%>

                        <%-- Script JS --%>
                            <%--<script src="app.js" type="text/javascript"></script>--%>

                                <script src="scripts/main.js" type="text/javascript" charset="UTF-8" defer></script>
                                <script src="scripts/modals.js" type="text/javascript" charset="UTF-8" defer></script>
                                <%--<script src="scripts/mercado_pago.js" type="text/javascript" defer></script>--%>

            </body>

            </html>