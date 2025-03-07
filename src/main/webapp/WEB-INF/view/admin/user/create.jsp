<%@page contentType="text/html" pageEncoding="UTF-8" %> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %> <%@taglib
uri="http://www.springframework.org/tags/form" prefix="form"%>

<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Create Users</title>
    <!-- Latest compiled and minified CSS -->
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
      rel="stylesheet"
    />

    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

    <script>
      $(document).ready(() => {
          const avatarFile = $("#avatarFile");
          avatarFile.change(function (e) {
              const imgURL = URL.createObjectURL(e.target.files[0]);
              $("#avatarPreview").attr("src", imgURL);
              $("#avatarPreview").css({ "display": "block" });
          });
      });
  </script>

    <!-- <link href="/css/demo.css" rel="stylesheet"> -->
  </head>

  <body>
    <div class="container mt-5">
      <div class="row">
        <div class="col-md-6 col-12 mx-auto">
          <h3>Create a user</h3>
          <hr />
          <form:form
            method="post"
            action="/admin/user/create"
            modelAttribute="newUser"
            enctype="multipart/form-data"
          >
          <div class="row">
            <div class="mb-3 col-12 col-md-6">
              <label class="form-label">Email:</label>
              <form:input type="email" class="form-control" path="email" />
            </div>
            <div class="mb-3 col-12 col-md-6">
              <label class="form-label">Password:</label>
              <form:input
                type="password"
                class="form-control"
                path="password"
              />
            </div>
          </div>
            
          <div class="row">
            <div class="mb-3 col-12 col-md-6">
              <label class="form-label">Phone number:</label>
              <form:input type="text" class="form-control" path="phone" />
            </div>
            <div class="mb-3 col-12 col-md-6">
              <label class="form-label">Full Name:</label>
              <form:input type="text" class="form-control" path="fullName" />
            </div>
          </div>

            <div class="mb-3">
              <label class="form-label">Address:</label>
              <form:input type="text" class="form-control" path="address" />
            </div>

           
            <div class="row">
              <div class="mb-3 col-12 col-md-6">
                <label class="form-label">Role:</label>
                <form:select class="form-select" path="role.name">
                    <form:option value="ADMIN">ADMIN</form:option>
                    <form:option value="USER">USER</form:option>
                </form:select>
              </div>

              <div class="mb-3 col-12 col-md-6">
                <label for="avatarFile" class="form-label">Avatar:</label>
                <input class="form-control" type="file" id="avatarFile"
                    accept=".png, .jpg, .jpeg" name="file">
              </div>

              <div class="col-12 mb-3">
                <img style="max-height: 250px; display: none; width: 100%; object-fit: contain;" alt="avatar preview"
                    id="avatarPreview" />
              </div>
            </div>
           
            <button type="submit" class="btn btn-primary">Create</button>
          </form:form>
        </div>
      </div>
    </div>
  </body>
</html>
