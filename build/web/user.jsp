<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%@ page
contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Account</title>
        <!-- Embed Reset -->
        <link rel="stylesheet" href="./assets/css/reset.css" />

        <!-- Embed Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
        <link
            href="https://fonts.googleapis.com/css2?family=Ysabeau+Infant:ital,wght@0,400;0,500;0,700;0,900;1,400;1,500;1,700;1,900&display=swap"
            rel="stylesheet"
        />

        <!-- Embed Css -->
        <link rel="stylesheet" href="./assets/css/main.css" />
    </head>
    <body>
        <c:import url="./header.jsp" />
        <main class="user">
            <div class="container">
                <div class="user__inner">
                    <section class="user-left">
                        <div class="user-left__inner">
                            <img src="" alt="" class="user-img" />

                            <h2 class="user__name"></h2>
                        </div>
                    </section>

                    <section class="user-right">
                        <div class="user-right__inner">
                            <div class="list">
                                <h3 class="list__heading">User name:</h3>
                                <p class="desc">${accounts.username}</p>
                            </div>

                            <div class="list">
                                <h3 class="list__heading">Email:</h3>
                                <p class="desc">${accounts.email}</p>
                            </div>

                            <div class="list">
                                <h3 class="list__heading">Phone:</h3>
                                <p class="desc">${accounts.phone}</p>
                            </div>

                            <div class="list">
                                <h3 class="list__heading">Address:</h3>
                                <p class="desc">${accounts.address}</p>
                            </div>
                        </div>
                        <c:url var="logout" value="MainController">
                            <c:param name="action" value="Logout" />
                        </c:url>
                        <div class="user__logout">
                            <a class="out" href="${logout}"
                                >Logout<img
                                    src="./assets/img/logout.jpg"
                                    alt="index.css"
                                    class="user-out_img"
                                />
                            </a>
                        </div>
                    </section>
                </div>
            </div>
        </main>
        <c:import url="./footer.jsp" />
    </body>
</html>
