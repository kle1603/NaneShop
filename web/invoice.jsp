<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%@ page
contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title></title>

        <!-- Embed Reset -->
        <link rel="stylesheet" href="./assets/css/reset.css" />

        <!-- Embed Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
        <link
            href="https://fonts.googleapis.com/css2?family=Ysabeau+Infant:ital,wght@0,400;0,500;0,700;0,900;1,400;1,500;1,700;1,900&display=swap"
            rel="stylesheet"
        />

        <!-- Embed css -->
        <link rel="stylesheet" href="./assets/css/main.css" />

    <body>
        <c:if
            test="${sessionScope.ROLE_ID == null || sessionScope.ROLE_ID ne 'US'}"
        >
            <c:redirect url="login.jsp"></c:redirect>
        </c:if>

        <article class="invoice">
            <div class="container">
                <div class="invoice__inner">
                    <a class="out" href="index.jsp"
                        ><img src="./assets/img/Vector.jpg" class="invoice__out" alt=""
                    /></a>
                    <div class="invoice__header">
                        <div class="invoice__logo">
                            <a href="index.jsp">
                                <img
                                    src="./assets/img/logo.jpg"
                                    alt=""
                                    class="invoice-image"
                                />
                            </a>
                        </div>
                        <div class="invoice__header-content">
                            <p class="invoice__header-desc">Invoice # A9XYZ</p>
                            <p class="invoice__header-desc">Nane Shop</p>
                            <p class="invoice__header-desc">HOCHIMINH CITY</p>
                        </div>
                    </div>
                    <h1 class="invoice__heading">
                        The information you need to know
                    </h1>
                    <p class="invoice__content">
                        Thank you very much for playing an important role in our development. We will continue to put your needs first as our company expands and improves.
                    </p>
                    <div class="invoice__footer">
                        <div class="invoice__payment">
                            <h2 class="invoice__payment-heading">Payment</h2>
                            <p class="invoice__payment-desc">
                                Momo: (+84)00-000-000
                            </p>
                            <p class="invoice__payment-desc">
                                Cash when receiving the goods.
                            </p>
                            <p class="invoice__payment-desc">
                                MB bank: 8686868686
                            </p>
                        </div>
                        <div class="invoice__contact">
                            <h2 class="invoice__contact-heading">Contact</h2>
                            <p class="invoice__contact-desc">
                                Phone: (+84)00-000-000
                            </p>
                            <p class="invoice__contact-desc">
                                Email: lachimolalasii1410@gmail.com
                            </p>
                            <p class="invoice__contact-desc">
                                Facebook: NaneShop
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </article>
    </body>
</html>
