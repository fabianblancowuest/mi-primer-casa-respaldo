<%@ Page Language="VB" Debug="true" MasterPageFile="~/master/p.master" AutoEventWireup="false"
  CodeFile="iniciocorrecto.aspx.vb" Inherits="iniciocorrecto" title="Inicio Correcto" %>

  <%--<%@ Register Src="~/Administracion/notificacionOperador.ascx" TagPrefix="uc1" TagName="notificacionOperador"
    %>--%>



    <asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    </asp:Content>
    <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <asp:Panel ID="opanelRoles" runat="server" Width="100%" CssClass="table-cemmi">
        <div>
          <%-- <uc1:notificacionOperador runat="server" ID="notificacionOperador" />--%>
        </div>
        <div class="contenedor-busqueda">
          <input type="search" name="" id="input-search" placeholder="Buscar...">
          <button type="button" class="btn btn-primary" id="btn-search">Buscar</button>
        </div>

        <!-- Tabla Roles -->
        <div class="contenedor-tabla-roles">
          <asp:Label runat="server" Text="ROLES ASIGNADOS POR USUARIO" CssClass="h2"></asp:Label>
          <asp:GridView CssClass="mGrid tabla-roles" AlternatingRowStyle-CssClass="alt" ID="ogvRolesUsuario"
            runat="server" AutoGenerateColumns="False"
            DataKeyNames="idAccesoRol,accesoRolCodigo,accesoRolDescripcion,accesoRolExplicacion,accesoRolPagina,accesoRolDocumentoOperativo,accesoRolEstado"
            DataSourceID="odsEmpresaOperadorRolDespilega"
            EmptyDataText="El usuario ingresado no tiene roles asignados en la Empresa seleccionada. Comuniquese con el administrador del Sistema.">
            <AlternatingRowStyle CssClass="alt" />
            <Columns>

              <asp:CommandField SelectText="Ejecutar" ShowSelectButton="True" />

              <asp:BoundField DataField="idAccesoRol" HeaderText="idAccesoRol" InsertVisible="False" ReadOnly="True"
                SortExpression="idAccesoRol" Visible="False" />
              <asp:TemplateField HeaderText="Rol" SortExpression="accesoRolCodigo" Visible="False">

                <ItemTemplate>
                  <asp:Label ID="Label1" runat="server" Text='<%# Bind("accesoRolCodigo") %>'>
                  </asp:Label>
                </ItemTemplate>
              </asp:TemplateField>
              <asp:TemplateField HeaderText="Descripción" SortExpression="accesoRolDescripcion">

                <ItemTemplate>
                  <asp:Label ID="Label2" runat="server" Text='<%# Bind("accesoRolDescripcion") %>' Font-Bold="true"
                    CssClass="acceso-rol"></asp:Label>
                  <br />
                  <asp:Label ID="Label3" runat="server" Text='<%# Bind("accesoRolExplicacion") %>'>
                  </asp:Label>
                </ItemTemplate>
              </asp:TemplateField>
              <asp:BoundField DataField="accesoRolPagina" HeaderText="Pagina" SortExpression="accesoRolPagina"
                Visible="False" />
              <asp:BoundField DataField="accesoRolDocumentoOperativo" HeaderText="Documento"
                SortExpression="accesoRolDocumentoOperativo" Visible="False" />
              <asp:CheckBoxField DataField="accesoRolEstado" HeaderText="Estado" SortExpression="accesoRolEstado"
                Visible="False" />
            </Columns>
          </asp:GridView>

        </div>
        <asp:SqlDataSource ID="odsEmpresaOperadorRolDespilega" runat="server"
          ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="empresaOperadorRolDespilega"
          SelectCommandType="StoredProcedure">
          <SelectParameters>
            <asp:SessionParameter Name="idEmpresaOperador" SessionField="idEmpresaOperador" Type="Int32" />
          </SelectParameters>
        </asp:SqlDataSource>
        <script>
          const inputSearch = document.getElementById("input-search");
          const btnSearch = document.getElementById("btn-search");

          const tituloRoles = document.querySelector(".h2");

          const list = document.querySelectorAll("span");
          const contenedorTablaRoles = document.querySelector(".contenedor-tabla-roles");

          const tabla = document.getElementById("ContentPlaceHolder1_ogvRolesUsuario");

          // Obtener todas las filas de la tabla (excluyendo el encabezado, si existe)
          const allRows = Array.from(tabla.querySelectorAll("tr"));

          const btnMenuPrincipal = document.createElement("a");
          btnMenuPrincipal.href = "../administracion/inicioCorrecto.aspx";
          btnMenuPrincipal.className = "btn btn-primary";
          btnMenuPrincipal.textContent = "MOSTRAR TODOS LOS ROLES";
          const mensajeBusqueda = document.createElement("div")
          mensajeBusqueda.classList.add("mensaje-busqueda");

          const funcionBusqueda = () => {

            let searched = inputSearch.value.toLowerCase();
            let hasResults = false;
            let allTheads = document.querySelectorAll("th")


            let tablaAux = document.createElement("div");
            // Filtrar y mostrar solo las tarjetas que coinciden con la búsqueda


            for (let row of allRows) {
              let cell = row.querySelector(".acceso-rol")

              if (cell) {
                const cardTitle = cell.textContent.toLocaleLowerCase();

                if (cardTitle.includes(searched)) {
                  row.style.display = ""; //Mostrar la fila
                  row.style.backgroundColor = "#E3F2FD";
                  hasResults = true;
                  inputSearch.value = "";
                  mensajeBusqueda.innerHTML = "";
                }
                else {
                  row.style.display = "none"; //Ocultar la fila

                }
              } else if (!cell) {


                contenedorTablaRoles.append(btnMenuPrincipal)

              }


            }
            // Mostrar el mensaje si no hay resultados
            if (!hasResults) {
              for (let i = 0; i < allTheads.length; i++) {
                allTheads[i].style.display = "none";

              }
              mensajeBusqueda.innerHTML = "";
              mensajeBusqueda.textContent += `No se encontraron coincidencias para "${inputSearch.value}".`;
              tituloRoles.style.display = "none";
              contenedorTablaRoles.append(mensajeBusqueda);
              inputSearch.value = "";

            }
          }


          if (btnSearch) {

            btnSearch.addEventListener("click", funcionBusqueda)
          }

          // Búsqueda con tecla enter
          if (inputSearch) {
            inputSearch.addEventListener("keydown", (event) => {
              if (event.key === "Enter") {
                event.preventDefault();
                funcionBusqueda();
              }
            });
          }


          console.log(btnSearch);
          console.log(tabla)
        </script>
      </asp:Panel>
    </asp:Content>