<%@ page import="java.util.ArrayList" %>
<%@ page import="ar.com.cac.finaljava23049lgs.oop.Persona" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
  <meta http-equiv="Pragma" content="no-cache" />
  <meta http-equiv="Expires" content="0" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>CaC23049</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
  <link rel="stylesheet" href="./estilos.css">
</head>
<body>
  <nav class="oscuro avbar navbar-expand-lg bg-body-tertiary">
      <div class="container-fluid">
      
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <ul class="navbar-nav me-auto mb-2 mb-lg-0">
            <li class="nav-item">
              <a class="nav-link active" aria-current="page" href="nuevo.jsp">Nuevo</a>
            </li>
            <li class="nav-item">
              <a class="nav-link active" aria-current="page" href="<%=request.getContextPath()%>/ListadoPersonasController">Listado</a>
            </li>              
          </ul>
          <form class="d-flex" role="search">
            <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
            <button class="btn btn-outline-success" type="submit">Search</button>
          </form>
        </div>
      </div>
    </nav>
  <% 
   /*codigo java*/
   ArrayList<Persona> listado = (ArrayList<Persona>)request.getAttribute("listado"); //esto es un array
  %>
  <!-- aca van los mensajes-->
  <%
    String error = (String)request.getAttribute("error");
    String success = (String)request.getAttribute("success");
  %>
  <%
    if(error!=null) {
  %>
  <div class="alert alert-danger" role="alert">
    <%=error%>
  </div>
  <%
    }
  %>
  <%
    if(success != null) {
  %>
  <div class="alert alert-success" role="alert">
    <%=success%>
  </div>
  <%
  }
  %>
  <div class="container">
      <div class="row">
          <div class="col-12">
              <section>
                  <h1>Listado de Articulos</h1>
                  <table class="table">
                      <thead>
                        <tr>
                          <th scope="col">#</th>
                          <th scope="col">Apellido</th>
                          <th scope="col">Nombre</th>
                          <th scope="col">Edad</th>
                          <th scope="col">Codigo</th>
                          
                        </tr>
                      </thead>
                      <tbody>
                          <% 
                          for(Persona unapersona : listado) {
                          %>
                              <tr>
                                <th scope="row"><%=unapersona.getId()%></th>
                                  <td><%=unapersona.getApellido()%></td>
                                  <td><%=unapersona.getNombre()%></td>
                                  <td><%=unapersona.getEdad()%></td>
                                  <td><%=unapersona.getCodigo()%></td>
                                  <td>
                                      <a href="<%=request.getContextPath()%>/EliminarController?id=<%=unapersona.getId()%>" class="btn btn-danger" tabindex="-1" role="button" aria-disabled="true">
                                          Eliminar
                                      </a>
                                      <a href="<%=request.getContextPath()%>/EditarController?id=<%=unapersona.getId()%>" 
                                          class="btn btn-warning" tabindex="-1" role="button" aria-disabled="true">
                                        Editar
                                    </a>
                                  </td>
                              </tr>
                          <% } %>
                      </tbody>
                    </table>
              </section>
          </div>
      </div>
</body>


</html>