<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%@ page
contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Smaller</title>

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
        <c:if
            test="${sessionScope.ROLE_ID == null || sessionScope.ROLE_ID ne 'AD'}"
        >
            <c:redirect url="login.jsp"></c:redirect>
        </c:if>

        <c:import url="./adminHeader.jsp" />

        <div
            class="popup__background ${requestScope.SUCCESS_CREATE ? 'popup__active' : 'popup__hidden'}"
        >
            <div class="popup__content">
                <div class="popup__image">
                    <img
                        src="./assets/img/check.svg"
                        alt=""
                        class="popup__img"
                    />
                </div>
                <div class="popup__body">
                    <h3 class="popup__heading">Successfully created!</h3>
                    <p class="popup__desc">New product is created</p>
                </div>
            </div>
        </div>

        <section class="admin-create">
            <div class="container">
                <form
                    action="MainController"
                    method="POST"
                    class="admin-create__inner"
                >
                    <div class="admin-create__top">
                        <h1 class="admin-create__heading">
                            Create your product
                        </h1>
                        <button
                            type="submit"
                            name="action"
                            value="AdminCreate"
                            class="btn admin-create__btn"
                        >
                            Create
                        </button>
                    </div>
                    <div class="admin-create__content">
                        <h2 class="admin-create__title">Product name :</h2>
                        <input
                            type="text"
                            class="admin-create__input admin-create__name"
                            name="productName"
                        />
                        <h2 class="admin-create__title">Product type id :</h2>
                        <input
                            type="number"
                            class="admin-create__input admin-create__type-id"
                            name="productTypeId"
                            min="1"
                            max="4"
                        />
                        <h2 class="admin-create__title">Product quantity :</h2>
                        <input
                            type="number"
                            class="admin-create__input admin-create__quantity"
                            name="productQuantity"
                            min="0"
                        />
                        <h2 class="admin-create__title">Product price :</h2>
                        <input
                            type="number"
                            step="0.01"
                            class="admin-create__input admin-create__price"
                            name="productPrice"
                            min="0"
                        />
                        <h2 class="admin-create__title">Product image url :</h2>
                        <input
                            type="text"
                            class="admin-create__input admin-create__image"
                            name="productImageUrl"
                        />
                    </div>
                </form>
            </div>
        </section>

        <script>
            setTimeout(function () {
                var popup = document.querySelector(".popup__active");
                if (popup) {
                    popup.classList.replace("popup__active", "popup__hidden");
                }
            }, 1000);
        </script>
    </body>
</html>
